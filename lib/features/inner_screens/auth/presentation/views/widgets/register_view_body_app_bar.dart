import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../../core/widgets/custom_text.dart';

class RegisterViewBodyAppBar extends StatelessWidget {
  const RegisterViewBodyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () =>
              Navigator.canPop(context) ? Navigator.pop(context) : null,
          child: Icon(
            IconlyLight.arrowLeft2,
            //   color: theme == true ? Colors.white : Colors.black,
            size: 24,
          ),
        ),
        const SizedBox(height: 40.0),
        CustomText(
          text: 'Welcome',
          color: Colors.white,
          fontSize: 30,
          isTitle: true,
        ),
        const SizedBox(height: 8),
        CustomText(
          text: "Sign up to continue",
          color: Colors.white,
          fontSize: 18,
          isTitle: false,
        ),
        const SizedBox(height: 30.0),
      ],
    );
  }
}
