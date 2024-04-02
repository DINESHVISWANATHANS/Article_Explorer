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
    apiKey: 'AIzaSyDqdmnAadBfENFtCwa0NNvYLn9w7mWTHLM',
    appId: '1:537159980398:web:2684861f5647c1e99a9d7f',
    messagingSenderId: '537159980398',
    projectId: 'article-explorer',
    authDomain: 'article-explorer.firebaseapp.com',
    storageBucket: 'article-explorer.appspot.com',
    measurementId: 'G-SQ2N9H5WR2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjAw0fwIinT76_rXsZ8lqzpV9dtlR9bYc',
    appId: '1:537159980398:android:cd4793f87d3a83989a9d7f',
    messagingSenderId: '537159980398',
    projectId: 'article-explorer',
    storageBucket: 'article-explorer.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCjXvLjkeMKq1wy-nwChkj4hFgEaxBOOjE',
    appId: '1:537159980398:ios:208ae1f62d4f4b809a9d7f',
    messagingSenderId: '537159980398',
    projectId: 'article-explorer',
    storageBucket: 'article-explorer.appspot.com',
    iosBundleId: 'com.example.articleExplorer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCjXvLjkeMKq1wy-nwChkj4hFgEaxBOOjE',
    appId: '1:537159980398:ios:2bebc1ad6024ae7f9a9d7f',
    messagingSenderId: '537159980398',
    projectId: 'article-explorer',
    storageBucket: 'article-explorer.appspot.com',
    iosBundleId: 'com.example.articleExplorer.RunnerTests',
  );
}