import 'package:elihssanadmin/Objects/produit.dart';
import 'package:elihssanadmin/Services/Produits.dart';
import 'package:flutter/material.dart';

class ProduitsProv extends ChangeNotifier {
  List<ProduitObj> _Allproduits = [];
  List<ProduitObj> get Allproduits => _Allproduits;
  Future<void> getAllproduit() async {
    _Allproduits = await ProduitsSer.getAllproduct();

    notifyListeners();
  }

  Future<void> updateQuntity(idproduit, newcntt, context) async {
    await ProduitsSer.updateQuntity(idproduit, newcntt, context);
    await getAllproduit();
  }

  Future<void> AddProduit(
      name,
      prixachat,
      Fournisseur,
      ZoneStockage,
      prixunigros,
      prixunisubgros,
      cntt,
      cnttemblg,
      DateExp,
      Category,
      image,
      verss,
      context) async {
    await ProduitsSer.postproduct(
        name,
        prixachat,
        Fournisseur,
        ZoneStockage,
        prixunigros,
        prixunisubgros,
        cntt,
        cnttemblg,
        DateExp,
        Category,
        image,
        verss,
        context);

    await getAllproduit();
  }

  Future<void> DeleteProduit(id) async {
    await ProduitsSer.deleteproduct(id);
    await getAllproduit();
  }
}
