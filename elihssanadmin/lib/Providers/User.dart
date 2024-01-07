import 'package:elihssanadmin/Objects/User.dart';
import 'package:elihssanadmin/Services/User.dart';
import 'package:flutter/material.dart';

class UserProv extends ChangeNotifier {
  List<UserObj> _AllaboutUsers = [];
  List<UserObj> get AllaboutUsers => _AllaboutUsers;
  List<UserObj> _AllaboutEmpl = [];
  List<UserObj> get AllaboutEmpl => _AllaboutEmpl;
  int _adminint = 0;
  int get adminInt => _adminint;
  Future<void> getAllaboutUsers() async {
    _AllaboutUsers = await USerServ.getAllAboutUsers();

    notifyListeners();
  }

  Future<void> getAllEmpl() async {
    _AllaboutEmpl = await USerServ.getAllEmpl();
    notifyListeners();
  }

  Future<void> getadmin() async {
    _adminint = await USerServ.getadmin();
    print("admin kayen");
    print(_adminint);
  }

  Future<void> addempl(name, lieu, context) async {
    await USerServ.AddEmpl(name, lieu, context);
    await getAllEmpl();
  }

  Future<int> updateempl(idempl, daterec, salairej, context) async {
    int status = await USerServ.updateempl(idempl, daterec, salairej, context);
    await getAllEmpl();
    return status;
  }
}
