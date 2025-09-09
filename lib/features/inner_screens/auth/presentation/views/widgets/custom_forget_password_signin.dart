import 'package:flutter/material.dart';

class CustomForgetPasswordSignin extends StatelessWidget {
  const CustomForgetPasswordSignin({
    super.key,
    this.onEditingComplete,
    this.textInputAction,
    this.controller,
    this.keyboardType,
    this.validator,
    this.hintText,
    this.focusNode,
    this.suffixIcon,
    this.obscureText = false,
  });
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;
  final FocusNode? focusNode;
  final bool obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      onEditingComplete: onEditingComplete,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty || value.length < 7) {
          return 'Please enter a valid password';
        } else {
          return null;
        }
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
        suffixIcon: suffixIcon,
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
