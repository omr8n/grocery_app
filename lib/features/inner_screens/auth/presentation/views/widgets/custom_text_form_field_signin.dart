import 'package:flutter/material.dart';

class CustomTextFormFieldSignin extends StatelessWidget {
  const CustomTextFormFieldSignin({
    super.key,
    required FocusNode passFocusNode,
    required TextEditingController emailTextController,
    this.onEditingComplete,
    this.textInputAction,
    this.controller,
    this.keyboardType,
    this.validator,
    this.hintText,
  });

  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        filled: true,
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
