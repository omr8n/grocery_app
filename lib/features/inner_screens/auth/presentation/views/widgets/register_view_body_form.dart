import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helper/functions/global_methods.dart';
import '../../../../../../core/widgets/auth_button.dart';
import '../../../forget_pass.dart';
import '../../cubits/signup_cubits/signup_cubit.dart';
import 'custom_text_form_feild_register_view.dart';

class RegisterViewBodyForm extends StatefulWidget {
  const RegisterViewBodyForm({super.key});

  @override
  State<RegisterViewBodyForm> createState() => _RegisterViewBodyFormState();
}

class _RegisterViewBodyFormState extends State<RegisterViewBodyForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _fullNameController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _addressTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  bool _obscureText = true;
  @override
  void dispose() {
    _fullNameController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _addressTextController.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  // bool _isLoading = false;
  void _submitFormOnRegister() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
      return;
    }
    FocusScope.of(context).unfocus();
    _formKey.currentState!.save();

    // إرسال البيانات إلى Cubit
    context.read<SignupCubit>().createUserWithEmailAndPassword(
      _emailTextController.text.trim(),
      _passTextController.text.trim(),
      _fullNameController.text.trim(),
      _addressTextController.text.trim(),

      // إذا كنت تريد إرسال الصورة أيضًا
    );
    // if (isValid) {
    //   _formKey.currentState!.save();
    //   setState(() {
    //     _isLoading = true;
    //   });
    //   try {
    //     await authInstance.createUserWithEmailAndPassword(
    //         email: _emailTextController.text.toLowerCase().trim(),
    //         password: _passTextController.text.trim());
    //     final User? user = authInstance.currentUser;
    //     final _uid = user!.uid;
    //     user.updateDisplayName(_fullNameController.text);
    //     user.reload();
    //     await FirebaseFirestore.instance.collection('users').doc(_uid).set({
    //       'id': _uid,
    //       'name': _fullNameController.text,
    //       'email': _emailTextController.text.toLowerCase(),
    //       'shipping-address': _addressTextController.text,
    //       'userWish': [],
    //       'userCart': [],
    //       'createdAt': Timestamp.now(),
    //     });
    //     Navigator.of(context).pushReplacement(MaterialPageRoute(
    //       builder: (context) => const FetchScreen(),
    //     ));
    //     print('Succefully registered');
    //   } on FirebaseException catch (error) {
    //     GlobalMethods.errorDialog(
    //         subtitle: '${error.message}', context: context);
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   } catch (error) {
    //     GlobalMethods.errorDialog(subtitle: '$error', context: context);
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   } finally {
    //     setState(() {
    //       _isLoading = false;
    //     });
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormFeildRegisterView(
                hintText: 'Full name',
                textInputAction: TextInputAction.next,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(_emailFocusNode),
                keyboardType: TextInputType.name,
                controller: _fullNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This Field is missing";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormFeildRegisterView(
                focusNode: _emailFocusNode,
                textInputAction: TextInputAction.next,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(_passFocusNode),
                keyboardType: TextInputType.emailAddress,
                controller: _emailTextController,
                validator: (value) {
                  if (value!.isEmpty || !value.contains("@")) {
                    return "Please enter a valid Email adress";
                  } else {
                    return null;
                  }
                },
                hintText: 'Email',
              ),
              const SizedBox(height: 20),
              //Password
              CustomTextFormFeildRegisterView(
                focusNode: _passFocusNode,
                obscureText: _obscureText,
                keyboardType: TextInputType.visiblePassword,
                controller: _passTextController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 7) {
                    return "Please enter a valid password";
                  } else {
                    return null;
                  }
                },
                hintText: "Password",
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(_addressFocusNode),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              CustomTextFormFeildRegisterView(
                focusNode: _addressFocusNode,
                textInputAction: TextInputAction.done,
                onEditingComplete: _submitFormOnRegister,
                controller: _addressTextController,
                validator: (value) {
                  if (value!.isEmpty || value.length < 10) {
                    return "Please enter a valid  address";
                  } else {
                    return null;
                  }
                },
                hintText: 'Shipping address',
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10),
              const SizedBox(height: 5.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    GlobalMethods.navigateTo(
                      ctx: context,
                      routeName: ForgetPasswordView.routeName,
                    );
                  },
                  child: const Text(
                    'Forget password?',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              AuthButton(
                buttonText: 'Sign up',
                onPressed: () {
                  _submitFormOnRegister();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
