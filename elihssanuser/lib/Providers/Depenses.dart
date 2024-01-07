import 'package:elihssanuser/Objects/Depense.dart';
import 'package:elihssanuser/Services/Depenses.dart';
import 'package:flutter/material.dart';

class DepensesProv extends ChangeNotifier {
  int _Totaldepenses = 0;
  int get Totaldepenses => _Totaldepenses;
  List<DepenseObj> _AllDepenses = [];
  List<DepenseObj> get AllDepenses => _AllDepenses;

  set Totaldepenses(newdepens) {
    _Totaldepenses = newdepens;
  }

  Future<void> getAlldepenses(user) async {
    _AllDepenses = await DepensesSer.getAlldepenses(user);
    for (var depense in _AllDepenses) {
      _Totaldepenses = _Totaldepenses + int.parse(depense.montant);
    }
    notifyListeners();
  }

  Future<void> Adddepense(category, montant, user, type) async {
    _Totaldepenses = 0;
    await DepensesSer.postdepense(category, montant, user, type);
    await getAlldepenses(user);
  }
}
