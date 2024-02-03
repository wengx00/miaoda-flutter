import 'package:mobx/mobx.dart';

part 'data.g.dart';

class DataStore extends _DataStore with _$DataStore {
  DataStore._internal();

  static DataStore? _instance;

  static DataStore use() {
    _instance ??= DataStore._internal();
    return _instance!;
  }
}

abstract class _DataStore with Store {
  

}