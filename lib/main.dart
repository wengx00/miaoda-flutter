import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:miaoda/pages/entry.dart';

import 'dart:core';

import 'package:miaoda/pages/login/login.dart';
import 'package:miaoda/store/user/user.dart';
import 'package:miaoda/utils/errors_handler.dart';

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

class MiaodaApp extends StatelessWidget {
  MiaodaApp({super.key}) {
    _userStore.initFromPrefs();
  }

  final _userStore = UserStore.use();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade600)),
        onGenerateRoute: (settings) {
          Widget page;
          switch (settings.name) {
            case 'home':
              page = const EntryPage();
              break;
            case 'login':
              page = const LoginPage();
              break;
            default:
              page = _userStore.token == null
                  ? const LoginPage()
                  : const EntryPage();
          }
          return MaterialPageRoute(
              builder: (context) => page, settings: settings);
        });
  }
}

Future<void> main() async {
  const handler = ErrorsHandler();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    handler.onErrorDetails(details);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    handler.onError(error, stack);
    return true;
  };
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MiaodaApp());
}
