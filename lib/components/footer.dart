import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Widget content;

  const Footer({
    super.key,
    required this.content
  });

  @override
  Widget build (BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 24, right: 24, top: 16),
        child: content
      ),
    );
  }
}