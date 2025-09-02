import 'package:flutter/material.dart';

class QuantityController extends StatelessWidget {
  const QuantityController(
      {super.key,
      this.onTap,
      required this.icon,
      required this.color,
      required this.padding});
  final void Function()? onTap;
  final IconData icon;
  final Color color;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
