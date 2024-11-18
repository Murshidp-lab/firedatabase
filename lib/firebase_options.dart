// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyC7r3CjJVJetC5KWpv3yw0Tt4ie39aUF-U',
    appId: '1:425566896211:web:09d2c9e342c721f64c06a6',
    messagingSenderId: '425566896211',
    projectId: 'fir-59c88',
    authDomain: 'fir-59c88.firebaseapp.com',
    storageBucket: 'fir-59c88.appspot.com',
    measurementId: 'G-P6EMECZCTE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1kjqYyro11-9AkdoWOO7dmDYrQTjIlb4',
    appId: '1:425566896211:android:04382a98a9f8f3294c06a6',
    messagingSenderId: '425566896211',
    projectId: 'fir-59c88',
    storageBucket: 'fir-59c88.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmoqjcD_IzmXQuaeRtxVzbWwd78L4A_3U',
    appId: '1:425566896211:ios:8f07a845e3bf4b444c06a6',
    messagingSenderId: '425566896211',
    projectId: 'fir-59c88',
    storageBucket: 'fir-59c88.appspot.com',
    iosBundleId: 'com.example.demo1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCmoqjcD_IzmXQuaeRtxVzbWwd78L4A_3U',
    appId: '1:425566896211:ios:8f07a845e3bf4b444c06a6',
    messagingSenderId: '425566896211',
    projectId: 'fir-59c88',
    storageBucket: 'fir-59c88.appspot.com',
    iosBundleId: 'com.example.demo1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC7r3CjJVJetC5KWpv3yw0Tt4ie39aUF-U',
    appId: '1:425566896211:web:d4e84f8316c3b5dd4c06a6',
    messagingSenderId: '425566896211',
    projectId: 'fir-59c88',
    authDomain: 'fir-59c88.firebaseapp.com',
    storageBucket: 'fir-59c88.appspot.com',
    measurementId: 'G-BF6NTK7D6F',
  );
}
