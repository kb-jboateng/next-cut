import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NextCut extends StatelessWidget {
  const NextCut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
          child: Text('Sign out'),
        ),
      ),
    );
  }
}