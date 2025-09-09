import 'package:flutter/material.dart';

class CustomTextFormFeildRegisterView extends StatelessWidget {
  const CustomTextFormFeildRegisterView({
    super.key,
    // required FocusNode passFocusNode,
    // required TextEditingController emailTextController,
    this.textInputAction,
    this.onEditingComplete,
    this.controller,
    this.validator,
    this.keyboardType,
    this.hintText,
    this.focusNode,
    this.suffixIcon,
    this.obscureText = false,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
  });

  // final FocusNode _passFocusNode;
  // final TextEditingController _emailTextController;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final bool obscureText;
  final int? maxLines;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      textAlign: textAlign,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
