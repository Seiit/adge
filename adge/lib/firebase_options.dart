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
        return macos;
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
    apiKey: 'AIzaSyCSXRE8g4-BDkxQO7f0oNjivXFY-maFTLs',
    appId: '1:175799000158:web:8adfd0ff5eb0d386f8e8cf',
    messagingSenderId: '175799000158',
    projectId: 'adge-14508',
    authDomain: 'adge-14508.firebaseapp.com',
    storageBucket: 'adge-14508.appspot.com',
    measurementId: 'G-KNTS7RNWX7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPnr-c4UrZzv4YP6KpBYbaHG4WNG3FaNs',
    appId: '1:175799000158:android:8e3204750facbb3ef8e8cf',
    messagingSenderId: '175799000158',
    projectId: 'adge-14508',
    storageBucket: 'adge-14508.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZ127GP6G7QDRegg7C6Pi9WHGKnr2kW4Q',
    appId: '1:175799000158:ios:3d55f00933d0319ff8e8cf',
    messagingSenderId: '175799000158',
    projectId: 'adge-14508',
    storageBucket: 'adge-14508.appspot.com',
    iosClientId: '175799000158-vtalrkmskmfrr6vimge429ks29paoq4o.apps.googleusercontent.com',
    iosBundleId: 'com.example.adge',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZ127GP6G7QDRegg7C6Pi9WHGKnr2kW4Q',
    appId: '1:175799000158:ios:3d55f00933d0319ff8e8cf',
    messagingSenderId: '175799000158',
    projectId: 'adge-14508',
    storageBucket: 'adge-14508.appspot.com',
    iosClientId: '175799000158-vtalrkmskmfrr6vimge429ks29paoq4o.apps.googleusercontent.com',
    iosBundleId: 'com.example.adge',
  );
}