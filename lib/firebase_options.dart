import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC64dHL3yFNQGzdo44TpyXmHYK9bEPNcWs',
    appId: '1:254532991107:android:ebf588791d203bbffdc3b6',
    messagingSenderId: '254532991107',
    projectId: 'next-cut',
    storageBucket: 'next-cut.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsvpnz3GjmTnQ5xELqmc_raH3GEhfuRA0',
    appId: '1:254532991107:ios:8b5f90b05ad42c90fdc3b6',
    messagingSenderId: '254532991107',
    projectId: 'next-cut',
    storageBucket: 'next-cut.appspot.com',
    iosBundleId: 'io.flutter.flutter.app',
    // iosBundleId: 'com.example.nextCut',
  );
}
