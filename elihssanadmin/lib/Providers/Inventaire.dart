import 'package:elihssanadmin/Objects/AllAboutCnttProduit.dart';
import 'package:elihssanadmin/Objects/Inventaire.dart';
import 'package:elihssanadmin/Services/Produits.dart';
import 'package:flutter/material.dart';

class InventaireProv extends ChangeNotifier {
  List<InventaireObj> _Allproduits = [];
  List<InventaireObj> get Allproduits => _Allproduits;
  List<AllaboutcnttProduitObj> _allaboutcnttProduitObj = [];
  List<AllaboutcnttProduitObj> get allaboutcnttProduitObj =>
      _allaboutcnttProduitObj;
  Future<void> getAllproduit(UserId) async {
    _Allproduits = await ProduitsSer.getAllInventaire(UserId);

    notifyListeners();
  }

  Future<void> getAllproduitOfInventaires(context) async {
    _allaboutcnttProduitObj =
        await ProduitsSer.getAllProduitsOfInventaire(context);
    print("maaaaaaaaaaaaamaaaaaaaaaaaa ${_allaboutcnttProduitObj.length}");
    notifyListeners();
  }

  Future<void> updateQuntityInInventaire(
      idproduit, newcntt, UserId, context) async {
    await ProduitsSer.updateQuntityInInventaire(idproduit, newcntt, context);
    await getAllproduit(UserId);
  }
}
