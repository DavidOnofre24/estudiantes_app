// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAebzIw7ROr0tU1VF9-gs-QGl61fkjetf8',
    appId: '1:604628347717:web:b7599591eb2fef1eacac2c',
    messagingSenderId: '604628347717',
    projectId: 'estudiantesapp-aa8bc',
    authDomain: 'estudiantesapp-aa8bc.firebaseapp.com',
    storageBucket: 'estudiantesapp-aa8bc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3JBOHOKo4UTBOoVN7JymZWlSUpoMAQEo',
    appId: '1:604628347717:android:bf02543851d85cabacac2c',
    messagingSenderId: '604628347717',
    projectId: 'estudiantesapp-aa8bc',
    storageBucket: 'estudiantesapp-aa8bc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8bsfN2Gl_cEeQn4s0Sp1GsmdsiWCT3ao',
    appId: '1:604628347717:ios:a8ec24faf8020cc2acac2c',
    messagingSenderId: '604628347717',
    projectId: 'estudiantesapp-aa8bc',
    storageBucket: 'estudiantesapp-aa8bc.appspot.com',
    iosClientId: '604628347717-6bhpe4epcjl4d5kttd2epfgvbsa27f3b.apps.googleusercontent.com',
    iosBundleId: 'com.example.estudiantesApp',
  );
}
