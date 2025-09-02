import 'package:flutter/material.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.buttonText,
    this.primary = Colors.white38,
    this.onPressed,
  });

  final void Function()? onPressed;
  final String buttonText;
  final Color primary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary, // background (button) color
          ),
          onPressed: onPressed,
          child: CustomText(
            text: buttonText,
            fontSize: 18,
            color: Colors.white,
          )),
    );
  }
}
