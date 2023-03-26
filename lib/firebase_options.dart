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
    apiKey: 'AIzaSyCvksWybITJRsHsPtQnfmZX48GnjBQyIOU',
    appId: '1:908752088350:web:f11c7e1212841194ed6d0f',
    messagingSenderId: '908752088350',
    projectId: 'artile-24962',
    authDomain: 'artile-24962.firebaseapp.com',
    databaseURL: 'https://artile-24962-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'artile-24962.appspot.com',
    measurementId: 'G-W5TK5X0KB3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApY73dAu9QCOFU9RrORZsbWfoYS9__0Eg',
    appId: '1:908752088350:android:337bda66c4f23272ed6d0f',
    messagingSenderId: '908752088350',
    projectId: 'artile-24962',
    databaseURL: 'https://artile-24962-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'artile-24962.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBE4x7Y4GOKz7IbkhzLKDLHeWkWvPGNncs',
    appId: '1:908752088350:ios:65bf1e15c39048a0ed6d0f',
    messagingSenderId: '908752088350',
    projectId: 'artile-24962',
    databaseURL: 'https://artile-24962-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'artile-24962.appspot.com',
    iosClientId: '908752088350-pl6isj0cb4rcit9ffeab79c8tgdnth5e.apps.googleusercontent.com',
    iosBundleId: 'com.example.colorTile',
  );
}
