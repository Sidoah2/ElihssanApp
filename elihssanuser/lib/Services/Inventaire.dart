import 'dart:convert' as convert;

import 'package:elihssanuser/Data/IpConfig.dart';
import 'package:elihssanuser/Objects/Inventaire.dart';
import 'package:elihssanuser/Objects/produit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InventairesServ {
  static Future<List<InventaireObj>> getAllInventaire(UserId) async {
    List<InventaireObj> Allproduits = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Inventaire/$UserId";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      for (var produit in jsonres) {
        InventaireObj produitObjet = InventaireObj(
          id: produit["_id"],
          isupdated: produit["isupdated"],
          cntt: produit["cntt"],
          PrixAchat: produit["PrixAchat"],
          prixuni: produit["PrixAchat"],
          Fournisseur: produit["Fournisseur"],
          ZoneStockage: produit["ZoneStockage"],
          name: produit["name"],
          image: produit["image"],
          category: produit["Category"],
        );
        Allproduits.add(produitObjet);
      }
    }
    return Allproduits;
  }

  static Future<void> postproduct(base64Str, name, prixuni, cntt, dateexp,
      category, id, context, User) async {
    List<ProduitObj> Allproduits = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Inventaire/$User/$id";
    final headerall = {'Content-Type': 'application/json'};
    final bodyall = convert.jsonEncode({
      "name": name,
      "prixuni": prixuni,
      "cntt": cntt,
      "DateExp": dateexp,
      "Category": category,
      "id": id,
      "image": base64Str
    });

    var res =
        await http.post(Uri.parse(uri), headers: headerall, body: bodyall);
    if (res.statusCode == 201) {
      Navigator.pop(context);
    }
  }

  static Future<void> updateQuntity(idproduit, Newcntt, context) async {
    var uri =
        "http://${IpConfig.ipconfig}:3030/Api/v1/Produits/updateQuntity/$idproduit";
    final headerall = {'Content-Type': 'application/json'};

    final bodyall = convert.jsonEncode({"cntt": Newcntt});
    final res =
        await http.put(Uri.parse(uri), headers: headerall, body: bodyall);
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);

      Navigator.pop(context);
    }
  }
}
