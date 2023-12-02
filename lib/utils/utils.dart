 import 'package:flutter/material.dart';

Future<void> _showDialog(BuildContext context, Widget message, Widget? title) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title,
        content: message,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'), 
            child: const Text('OK')
          )
        ],
      );
    }
  );
}