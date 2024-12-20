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
    apiKey: 'AIzaSyAcUujyODyxEZFM13ZXaeQyjNTthJr2vbI',
    appId: '1:711868623840:web:b2592c9f41d14410861985',
    messagingSenderId: '711868623840',
    projectId: 'mobil2formatiffinal2022',
    authDomain: 'mobil2formatiffinal2022.firebaseapp.com',
    storageBucket: 'mobil2formatiffinal2022.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAb5QfEL_L0KoCAxuUoF0FduODDYlTEWRI',
    appId: '1:711868623840:android:6ea28c1454dfd69c861985',
    messagingSenderId: '711868623840',
    projectId: 'mobil2formatiffinal2022',
    storageBucket: 'mobil2formatiffinal2022.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4-0gKCp-JXZpyhDVx782rZ6DHEyCATgk',
    appId: '1:711868623840:ios:4e31ea90d6dff889861985',
    messagingSenderId: '711868623840',
    projectId: 'mobil2formatiffinal2022',
    storageBucket: 'mobil2formatiffinal2022.firebasestorage.app',
    iosBundleId: 'com.example.firestore2022Lazcano',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4-0gKCp-JXZpyhDVx782rZ6DHEyCATgk',
    appId: '1:711868623840:ios:4e31ea90d6dff889861985',
    messagingSenderId: '711868623840',
    projectId: 'mobil2formatiffinal2022',
    storageBucket: 'mobil2formatiffinal2022.firebasestorage.app',
    iosBundleId: 'com.example.firestore2022Lazcano',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAcUujyODyxEZFM13ZXaeQyjNTthJr2vbI',
    appId: '1:711868623840:web:b49e94148a2c8448861985',
    messagingSenderId: '711868623840',
    projectId: 'mobil2formatiffinal2022',
    authDomain: 'mobil2formatiffinal2022.firebaseapp.com',
    storageBucket: 'mobil2formatiffinal2022.firebasestorage.app',
  );
}
