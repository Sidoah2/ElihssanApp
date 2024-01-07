import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LocaldbProv extends ChangeNotifier {
  String _User = "";
  String get User => _User;
  getUser() async {
    final LocalDB = Hive.box("LocalDB");
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa hhhhhhhhhhh");

    if (LocalDB.values.toList().length != 0) {
      List values = LocalDB.values.toList();
      _User = values[0];
    } else {
      _User = "";
    }
  }

  Future<void> postUser(User) async {
    _User = User;
    final LocalDB = Hive.box("LocalDB");

    LocalDB.add(User);
  }
}
