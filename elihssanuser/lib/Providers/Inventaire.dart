import 'package:elihssanuser/Objects/Inventaire.dart';
import 'package:elihssanuser/Services/Produits.dart';
import 'package:flutter/material.dart';

class InventaireProv extends ChangeNotifier {
  List<InventaireObj> _Allproduits = [];
  List<InventaireObj> get Allproduits => _Allproduits;

  Future<void> getAllproduit(UserId) async {
    _Allproduits = await ProduitsSer.getAllInventaire(UserId);

    notifyListeners();
  }

  Future<void> updateQuntityInInventaire(
      idproduit, newcntt, UserId, context) async {
    await ProduitsSer.updateQuntityInInventaire(idproduit, newcntt, context);
    await getAllproduit(UserId);
    Navigator.pop(context);
  }
}
