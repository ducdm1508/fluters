import 'package:flutter/material.dart';

class DottedBorder extends StatelessWidget {
  final Widget child;
  final Color color;

  const DottedBorder({
    Key? key,
    required this.child,
    this.color = const Color(0xFF2D9D48),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
