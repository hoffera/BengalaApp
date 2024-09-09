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
    apiKey: 'AIzaSyDmRABPfXF3RhB4KJydOVGh5HznIaSp4Pk',
    appId: '1:80880340042:web:b3a6eeb5568eb1ae88eab3',
    messagingSenderId: '80880340042',
    projectId: 'bengalaapp-41ddc',
    authDomain: 'bengalaapp-41ddc.firebaseapp.com',
    storageBucket: 'bengalaapp-41ddc.appspot.com',
    measurementId: 'G-CTBWRV3KMT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZILTxVtJLeMDPD_pR-fzV_jBZI2-NcGs',
    appId: '1:80880340042:android:0e1b9d99cc36f31188eab3',
    messagingSenderId: '80880340042',
    projectId: 'bengalaapp-41ddc',
    storageBucket: 'bengalaapp-41ddc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2RO64B7kEPjDifjNPVBLIu9xny6aK7dY',
    appId: '1:80880340042:ios:fe8b527850c834fa88eab3',
    messagingSenderId: '80880340042',
    projectId: 'bengalaapp-41ddc',
    storageBucket: 'bengalaapp-41ddc.appspot.com',
    iosBundleId: 'com.example.bengalapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB2RO64B7kEPjDifjNPVBLIu9xny6aK7dY',
    appId: '1:80880340042:ios:fe8b527850c834fa88eab3',
    messagingSenderId: '80880340042',
    projectId: 'bengalaapp-41ddc',
    storageBucket: 'bengalaapp-41ddc.appspot.com',
    iosBundleId: 'com.example.bengalapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDmRABPfXF3RhB4KJydOVGh5HznIaSp4Pk',
    appId: '1:80880340042:web:c8e2d85f354ff29688eab3',
    messagingSenderId: '80880340042',
    projectId: 'bengalaapp-41ddc',
    authDomain: 'bengalaapp-41ddc.firebaseapp.com',
    storageBucket: 'bengalaapp-41ddc.appspot.com',
    measurementId: 'G-FEWBYBFLD1',
  );

}