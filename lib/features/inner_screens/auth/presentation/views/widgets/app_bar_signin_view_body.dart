import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_text.dart';

class AppBarSignInViewBody extends StatelessWidget {
  const AppBarSignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 120.0),
        CustomText(
          text: 'Welcome Back',
          color: Colors.white,
          fontSize: 30,
          isTitle: true,
        ),
        const SizedBox(height: 8),
        CustomText(
          text: "Sign in to continue",
          color: Colors.white,
          fontSize: 18,
          isTitle: false,
        ),
        const SizedBox(height: 30.0),
      ],
    );
  }
}
