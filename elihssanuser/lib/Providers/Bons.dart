import 'package:elihssanuser/Objects/Bon.dart';
import 'package:elihssanuser/Objects/Bons.dart';
import 'package:elihssanuser/Providers/Clients.dart';
import 'package:elihssanuser/Services/Bons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BonsProv extends ChangeNotifier {
  List<BonsObj> _AllBons = [];
  List<BonsObj> get AllBons => _AllBons;

  Future<void> getAllclients() async {
    notifyListeners();
  }

  Future<void> getAll() async {
    _AllBons = await BonsSer.getAll();

    notifyListeners();
  }

  Future<void> AddBon(BonobjForADD bon, context, IdUser) async {
    await BonsSer.Addbon(bon, context);
    await Provider.of<ClientsProv>(context, listen: false)
        .getAllclients(IdUser);
  }
}
