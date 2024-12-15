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
    apiKey: 'AIzaSyA1xcf63zOKD4QcB7ZMzcKK301ij496Rc8',
    appId: '1:974341023422:web:12b06079aa0cefa3f560ef',
    messagingSenderId: '974341023422',
    projectId: 'jo-flutter',
    authDomain: 'jo-flutter.firebaseapp.com',
    storageBucket: 'jo-flutter.firebasestorage.app',
    measurementId: 'G-8DT528NDQR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASfr0SA_X3m2VDN2RrdXliDeeGYA_GEns',
    appId: '1:974341023422:android:25bc11811c799c0ff560ef',
    messagingSenderId: '974341023422',
    projectId: 'jo-flutter',
    storageBucket: 'jo-flutter.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAu4vbI29yySwG83q4LAps5_NO4PmV1YoA',
    appId: '1:974341023422:ios:5666213ab3f8e49ef560ef',
    messagingSenderId: '974341023422',
    projectId: 'jo-flutter',
    storageBucket: 'jo-flutter.firebasestorage.app',
    iosBundleId: 'com.example.joUnivFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAu4vbI29yySwG83q4LAps5_NO4PmV1YoA',
    appId: '1:974341023422:ios:5666213ab3f8e49ef560ef',
    messagingSenderId: '974341023422',
    projectId: 'jo-flutter',
    storageBucket: 'jo-flutter.firebasestorage.app',
    iosBundleId: 'com.example.joUnivFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA1xcf63zOKD4QcB7ZMzcKK301ij496Rc8',
    appId: '1:974341023422:web:f639626d14210536f560ef',
    messagingSenderId: '974341023422',
    projectId: 'jo-flutter',
    authDomain: 'jo-flutter.firebaseapp.com',
    storageBucket: 'jo-flutter.firebasestorage.app',
    measurementId: 'G-6VEN2X2CVZ',
  );
}