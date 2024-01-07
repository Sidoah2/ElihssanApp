import 'package:elihssanuser/Objects/User.dart';
import 'package:flutter/material.dart';

class UserProv extends ChangeNotifier {
  List<UserObj> _AllaboutUsers = [];
  List<UserObj> get AllaboutUsers => _AllaboutUsers;
  List<UserObj> _AllaboutEmpl = [];
  List<UserObj> get AllaboutEmpl => _AllaboutEmpl;
}
