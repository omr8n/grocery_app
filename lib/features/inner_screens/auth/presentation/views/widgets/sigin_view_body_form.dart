import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/features/inner_screens/auth/forget_pass.dart';
import 'package:grocery_app/features/inner_screens/auth/presentation/views/widgets/custom_forget_password_signin.dart';

import '../../../../../../core/helper/functions/global_methods.dart';
import '../../../../../../core/widgets/auth_button.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import 'custom_text_form_field_signin.dart';

class SiginViewBodyForm extends StatefulWidget {
  const SiginViewBodyForm({super.key});

  @override
  State<SiginViewBodyForm> createState() => _SiginViewBodyFormState();
}

class _SiginViewBodyFormState extends State<SiginViewBodyForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  // bool _isLoading = false;
  void _submitFormOnLogin() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        // _isLoading = true;
      });
      try {
        // await authInstance.signInWithEmailAndPassword(
        //     email: _emailTextController.text.toLowerCase().trim(),
        //     password: _passTextController.text.trim());
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (context) => const FetchScreen(),
        //   ),
        // );
        print('Succefully logged in');
      }
      //  on FirebaseException catch (error) {
      //   GlobalMethods.errorDialog(
      //       subtitle: '${error.message}', context: context);
      //   setState(() {
      //     _isLoading = false;
      //   });
      // }
      catch (error) {
        GlobalMethods.errorDialog(subtitle: '$error', context: context);
        setState(() {
          // _isLoading = false;
        });
      } finally {
        setState(() {
          // _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormFieldSignin(
                hintText: 'Email',
                textInputAction: TextInputAction.next,
                controller: _emailTextController,
                keyboardType: TextInputType.emailAddress,
                passFocusNode: _passFocusNode,
                emailTextController: _emailTextController,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  } else {
                    return null;
                  }
                },
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(_passFocusNode),
              ),
              SizedBox(height: 12),

              //Password
              CustomForgetPasswordSignin(
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  _submitFormOnLogin();
                },
                controller: _passTextController,
                focusNode: _passFocusNode,
                obscureText: _obscureText,

                keyboardType: TextInputType.visiblePassword,

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
                validator: (value) {
                  if (value!.isEmpty || value.length < 7) {
                    return 'Please enter a valid password';
                  } else {
                    return null;
                  }
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
              GlobalMethods.navigateTo(
                ctx: context,
                routeName: ForgetPasswordView.routeName,
              );
            },
            child: const Text(
              'Forget password?',
              maxLines: 1,
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 18,
                decoration: TextDecoration.underline,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        AuthButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();

              context.read<SigninCubit>().signin(
                _emailTextController.text.trim(),
                _passTextController.text.trim(),
              );
            } else {
              autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
          },
          buttonText: 'Login',
        ),
      ],
    );
  }
}
