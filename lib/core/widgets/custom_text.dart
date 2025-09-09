import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.isTitle = false,
    this.fontSize = 18,
    this.maxLines = 10,
    this.overflow,
  });
  final String text;
  final Color? color;

  final bool isTitle;
  final double? fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color,
        fontSize: fontSize,
        fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
