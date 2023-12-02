import 'package:flutter/material.dart';
import 'package:next_cut/utils/theme.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final dynamic onPressed;

  const CustomTextButton({
    required this.text,
    required this.onPressed,
    this.textColor = orange
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        elevation: MaterialStateProperty.all(0.0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all<Size>(Size(50, 20)),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      ),
      child: Text(text)
    );
  }
}