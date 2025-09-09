import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
import 'package:grocery_app/features/inner_screens/auth/presentation/views/widgets/sigin_view_body_form.dart';
import 'package:grocery_app/features/inner_screens/auth/register_view.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/helper/functions/global_methods.dart';
import '../../../../../../core/widgets/auth_button.dart';
import '../../../../../../core/widgets/google_button.dart';
import '../../../../fetch_screen.dart';
import 'app_bar_signin_view_body.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Swiper(
            duration: 800,
            autoplayDelay: 8000,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                AppConstants.authImagesPaths[index],
                fit: BoxFit.cover,
              );
            },
            autoplay: true,
            itemCount: AppConstants.authImagesPaths.length,
          ),
          Container(color: Colors.black.withOpacity(0.7)),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  AppBarSignInViewBody(),
                  SiginViewBodyForm(),

                  const SizedBox(height: 10),
                  GoogleButton(),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(color: Colors.white, thickness: 2),
                      ),
                      const SizedBox(width: 5),
                      CustomText(text: 'OR', color: Colors.white, fontSize: 18),
                      const SizedBox(width: 5),
                      const Expanded(
                        child: Divider(color: Colors.white, thickness: 2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  AuthButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FetchScreen(),
                        ),
                      );
                    },
                    buttonText: 'Continue as a guest',
                    primary: Colors.black,
                  ),
                  const SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                      children: [
                        TextSpan(
                          text: '  Sign up',
                          style: const TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              GlobalMethods.navigateTo(
                                ctx: context,
                                routeName: RegisterView.routeName,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
