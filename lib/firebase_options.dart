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
    apiKey: 'AIzaSyCenEDx-lLmc3PccOjGTn6MKApphqqSMAc',
    appId: '1:682979098718:web:4b5fb9af7fb7c7b7c6b4cf',
    messagingSenderId: '682979098718',
    projectId: 'digestify-2ab01',
    authDomain: 'digestify-2ab01.firebaseapp.com',
    storageBucket: 'digestify-2ab01.appspot.com',
    measurementId: 'G-S0X4V2QQTV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDzbC6st9jAv4DNqRKX7S5ZkU_WIibsCdE',
    appId: '1:682979098718:android:771f598fe301f54cc6b4cf',
    messagingSenderId: '682979098718',
    projectId: 'digestify-2ab01',
    storageBucket: 'digestify-2ab01.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwPbiViFNKTG0a4sfLR4752MlsoAyuNwc',
    appId: '1:682979098718:ios:e0fae0b1276bb67dc6b4cf',
    messagingSenderId: '682979098718',
    projectId: 'digestify-2ab01',
    storageBucket: 'digestify-2ab01.appspot.com',
    iosBundleId: 'com.example.newssApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwPbiViFNKTG0a4sfLR4752MlsoAyuNwc',
    appId: '1:682979098718:ios:e0fae0b1276bb67dc6b4cf',
    messagingSenderId: '682979098718',
    projectId: 'digestify-2ab01',
    storageBucket: 'digestify-2ab01.appspot.com',
    iosBundleId: 'com.example.newssApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCenEDx-lLmc3PccOjGTn6MKApphqqSMAc',
    appId: '1:682979098718:web:a1c5fb19e82bcc11c6b4cf',
    messagingSenderId: '682979098718',
    projectId: 'digestify-2ab01',
    authDomain: 'digestify-2ab01.firebaseapp.com',
    storageBucket: 'digestify-2ab01.appspot.com',
    measurementId: 'G-Q6RPE24C9W',
  );

}