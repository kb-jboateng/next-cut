import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/material.dart';
import 'package:next_cut/next-cut.dart';
import 'package:next_cut/screens/auth/login.dart';
import 'package:next_cut/screens/setup/profile-setup.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const LoginPage();
        }

        if (snapshot.data?.displayName?.isEmpty ?? true) {
          return const ProfileSetup();
        }

        return const NextCut();
      },
    );
  }
}