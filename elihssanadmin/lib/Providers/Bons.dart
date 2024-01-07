import 'package:elihssanadmin/Objects/Bon.dart';
import 'package:elihssanadmin/Objects/Bons.dart';
import 'package:elihssanadmin/Providers/Clients.dart';
import 'package:elihssanadmin/Services/Bons.dart';
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

  Future<void> AddBon(BonobjForADD bon, context) async {
    await BonsSer.Addbon(bon, context);
    await Provider.of<ClientsProv>(context, listen: false).getAllAboutClients();
  }
}
