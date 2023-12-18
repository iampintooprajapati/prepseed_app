import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String icon;
  const CustomIconButton({
    super.key,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shadows: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 12,
            offset: Offset(3, 3),
            spreadRadius: 0,
          )
        ],
      ),
      height: 30,
      width: 30,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(icon),
      ),
    );
  }
}
