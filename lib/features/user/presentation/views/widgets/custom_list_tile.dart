import 'package:flutter/material.dart';

import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.subtitle,
  });

  final String title;
  final void Function()? onTap;
  final IconData icon;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CustomText(text: title, fontSize: 22, isTitle: true),
      subtitle: CustomText(text: subtitle ?? "", fontSize: 18),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: onTap,
    );
  }
}
