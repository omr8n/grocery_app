import 'package:card_swiper/card_swiper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/core/helper/functions/global_methods.dart';

import 'package:grocery_app/core/widgets/custom_text.dart';

import '../../../core/constants/app_constants.dart';

import '../../../core/utils/utils.dart';
import '../../../core/widgets/auth_button.dart';
import '../../../core/widgets/back_widget.dart';
import '../../../core/widgets/loading_manager.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});
  static const routeName = '/ForgetPasswordScreen';
  @override
  State<ForgetPasswordView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ForgetPasswordView> {
  final _emailTextController = TextEditingController();
  // bool _isLoading = false;
  @override
  void dispose() {
    _emailTextController.dispose();

    super.dispose();
  }

  bool _isLoading = false;
  void _forgetPassFCT() async {
    if (_emailTextController.text.isEmpty ||
        !_emailTextController.text.contains("@")) {
      GlobalMethods.errorDialog(
        subtitle: 'Please enter a correct email address',
        context: context,
      );
    } else {
      setState(() {
        _isLoading = true;
      });
      try {
        final FirebaseAuth authInstance = FirebaseAuth.instance;
        await authInstance.sendPasswordResetEmail(
          email: _emailTextController.text.toLowerCase(),
        );
        GlobalMethods.errorDialog(
          subtitle: '"An email has been sent to your email address"',
          context: context,
        );
        setState(() {
          _isLoading = false;
        });
        // Fluttertoast.showToast(
        //   msg: "An email has been sent to your email address",
        //   toastLength: Toast.LENGTH_LONG,
        //   gravity: ToastGravity.CENTER,
        //   timeInSecForIosWeb: 1,
        //   backgroundColor: Colors.grey.shade600,
        //   textColor: Colors.white,
        //   fontSize: 16.0,
        // );
      } on FirebaseException catch (error) {
        GlobalMethods.errorDialog(
          subtitle: '${error.message}',
          context: context,
        );
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        GlobalMethods.errorDialog(subtitle: '$error', context: context);
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: LoadingManager(
        isLoading: _isLoading,
        child: Stack(
          children: [
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  AppConstants.authImagesPaths[index],
                  fit: BoxFit.cover,
                );
              },
              autoplay: true,
              itemCount: AppConstants.authImagesPaths.length,

              // control: const SwiperControl(),
            ),
            Container(color: Colors.black.withOpacity(0.7)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.1),
                  const BackWidget(),
                  const SizedBox(height: 20),
                  CustomText(
                    text: 'Forget password',
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _emailTextController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Email address',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  AuthButton(
                    buttonText: 'Reset now',
                    onPressed: () {
                      _forgetPassFCT();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
