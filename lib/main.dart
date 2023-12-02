import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:next_cut/firebase_options.dart';
import 'package:next_cut/utils/app_state.dart';
import 'package:next_cut/utils/auth_gate.dart';
import 'package:next_cut/utils/theme.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
   try {
     FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
     await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
     await FirebaseStorage.instance.useStorageEmulator('localhost', 9199);
   } catch (e) {
     // ignore: avoid_print
     print(e);
   }
 }

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      builder: ((context, child) =>  const App()),
    )
  );
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true, 
        colorScheme: myColorScheme, 
        appBarTheme: AppBarTheme(backgroundColor: background),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: Colors.white
          ),
          hintStyle: TextStyle(
            color: Colors.white24
          ),
          filled: true,
          fillColor: darkGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8), 
            borderSide: BorderSide(color: lightGrey, width: .5)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.white30, width: 1)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: lightGrey, width: 1)
          ),
          contentPadding: EdgeInsets.all(8),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: Size.fromHeight(48),
            maximumSize: Size.fromWidth(double.infinity),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          )
        )
      ),
      home: const AuthGate(),
    );
  }
}