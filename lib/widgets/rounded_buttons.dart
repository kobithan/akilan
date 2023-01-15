import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class RoundedButton extends StatelessWidget {
  final String name;
  final Color color;
  final VoidCallback press;
  final double hPadding;
  final Color textColor;
  final double vPadding;

  const RoundedButton(
      this.name,
      this.color,
      this.press,
      this.hPadding,
      this.textColor,
      this.vPadding, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: TextButton(
        onPressed: press,
        child: Text(
          name,
          style: TextStyle(
            color: textColor,
            fontSize: 12.sp,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding:
          EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
        ),
      ),
    );
  }
}
