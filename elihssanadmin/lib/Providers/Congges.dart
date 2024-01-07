import 'package:elihssanadmin/Objects/Congees.dart';
import 'package:elihssanadmin/Providers/User.dart';
import 'package:elihssanadmin/Services/Congees.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CongeesProv extends ChangeNotifier {
  List<CongeesObj> _AllCongees = [];
  List<CongeesObj> get AllCongees => _AllCongees;
  Future<void> getAllcongesOfUser(user) async {
    _AllCongees = await CongeesSer.getAllcongesOfUser(user);
    notifyListeners();
  }

  Future<void> AddDateArvOfCurrentCongee(user, context) async {
    await CongeesSer.AddDateArvOfCurrentCongee(user);
    await Provider.of<UserProv>(context, listen: false).getAllEmpl();
  }

  Future<void> AddDateDepart(user, context) async {
    await CongeesSer.AddDateDepart(user);
    await Provider.of<UserProv>(context, listen: false).getAllEmpl();
  }
}
