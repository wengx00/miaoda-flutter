import 'dart:core';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miaoda/pages/entry.dart';
import 'package:miaoda/pages/login/login.dart';
import 'package:miaoda/pages/setting/setting.dart';
import 'package:miaoda/store/user/user.dart';
import 'package:miaoda/utils/config.dart';
import 'package:miaoda/utils/errors_handler.dart';

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

class MiaodaApp extends StatelessWidget {
  MiaodaApp({super.key});

  final _userStore = UserStore.use();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade600)),
      navigatorKey: rootKey,
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case 'home':
            page = const EntryPage();
            break;
          case 'login':
            page = const LoginPage();
            break;
          case 'setting':
            page = const SettingPage();
          default:
            page = _userStore.token == null
                ? const LoginPage()
                : const EntryPage();
        }
        return CupertinoPageRoute(
            builder: (context) => page, settings: settings);
      },
      builder: (context, child) => Overlay(
        initialEntries: [OverlayEntry(builder: (context) => child!)],
      ),
    );
  }
}

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
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
  final userStore = UserStore.use();
  await userStore.initFromPrefs();
  runApp(MiaodaApp());
}
