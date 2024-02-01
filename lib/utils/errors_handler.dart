import 'package:flutter/src/foundation/assertions.dart';

class ErrorsHandler {
  const ErrorsHandler();
  void onErrorDetails(FlutterErrorDetails details) {}

  void onError(Object error, StackTrace stack) {
    print(error);
    print(stack);
  }

}