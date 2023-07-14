import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  final String buttonTitle;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double height = 60.0;
  final width = double.infinity;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height),
        backgroundColor: backgroundColor ?? const Color(0xFFFA4A0C),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      onPressed: onPressed,
      child: Text(
        buttonTitle,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
