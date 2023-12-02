import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final Widget content;

  const BasePage({
    super.key,
    required this.content
  });

  @override
  Widget build (BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(24.0),
      child: content
    );
  }
}