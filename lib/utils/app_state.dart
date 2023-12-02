import 'package:firebase_auth/firebase_auth.dart'
    hide PhoneAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:next_cut/firebase_options.dart';


class AppState extends ChangeNotifier {
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  AppState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseAuth.instance.userChanges().listen((user) {
      _loggedIn = user != null;
      notifyListeners();
    });
  }
}