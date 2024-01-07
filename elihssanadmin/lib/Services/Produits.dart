import 'dart:convert' as convert;

import 'package:elihssanadmin/Data/IpConfig.dart';
import 'package:elihssanadmin/Objects/AllAboutCnttProduit.dart';
import 'package:elihssanadmin/Objects/Inventaire.dart';
import 'package:elihssanadmin/Objects/produit.dart';
import 'package:elihssanadmin/Providers/Produits.dart';
import 'package:elihssanadmin/Providers/User.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProduitsSer {
  static Future<List<ProduitObj>> getAllproduct() async {
    List<ProduitObj> Allproduits = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Produits/";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      for (var produit in jsonres) {
        ProduitObj produitObjet = ProduitObj(
            id: produit["_id"],
            cntt: produit["cntt"],
            PrixAchat: produit["PrixAchat"],
            Fournisseur: produit["Fournisseur"],
            ZoneStockage: produit["ZoneStockage"],
            dateAchat: produit["DateAchat"],
            name: produit["name"],
            dateExp: produit["DateExp"],
            category: produit["Category"],
            verss: produit["verss"],
            prixunigros: produit["prixunigros"],
            prixunisubgros: produit["prixunisubgros"],
            image: produit["image"]);
        Allproduits.add(produitObjet);
      }
    }
    return Allproduits;
  }

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
          Fournisseur: produit["Fournisseur"],
          ZoneStockage: produit["ZoneStockage"],
          name: produit["name"],
          category: produit["Category"],
        );
        Allproduits.add(produitObjet);
      }
    }
    return Allproduits;
  }

  static Future<List<AllaboutcnttProduitObj>> getAllProduitsOfInventaire(
      context) async {
    List<AllaboutcnttProduitObj> prduitsAndCntts = [];
    List<int> allaboutcnttProduit = [];
    int cntt = 0;
    print("maaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaammmm");

    await Provider.of<ProduitsProv>(context, listen: false).getAllproduit();

    for (var produit
        in Provider.of<ProduitsProv>(context, listen: false).Allproduits) {
      cntt = 0;
      allaboutcnttProduit.clear();
      var uri =
          "http://${IpConfig.ipconfig}:3030/Api/v1/Inventaire/Produit/${produit.name}";
      var res = await http.get(Uri.parse(uri));

      if (res.statusCode == 200) {
        var jsonres = convert.jsonDecode(res.body);

        for (var jsn in jsonres) {
          if (jsn["UserId"] != "admin") {
            allaboutcnttProduit.add(jsn["cntt"]);
          }
        }
        for (var i = 0; i < allaboutcnttProduit.length; i++) {
          cntt = cntt + allaboutcnttProduit[i];
        }
        AllaboutcnttProduitObj produitObjet = AllaboutcnttProduitObj(
          nameproduit: produit.name,
          ProduitInallUsers: cntt,
        );
        print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx ${cntt}");

        prduitsAndCntts.add(produitObjet);
      }
    }
    return prduitsAndCntts;
  }

  static Future<List<ProduitObj>> getAllproductDeFournisseur(
      idFournisseur) async {
    List<ProduitObj> Allproduits = [];
    print("aaaaaaaaaaaaaaaaaaaaaaaa");
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Produits/$idFournisseur";
    var res = await http.get(Uri.parse(uri));
    print("aaaaaaaaaaaaaaaaaaaaaaaa ${res.statusCode}");

    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      for (var produit in jsonres) {
        ProduitObj produitObjet = ProduitObj(
            id: produit["_id"],
            cntt: produit["cntt"],
            PrixAchat: produit["PrixAchat"],
            Fournisseur: produit["Fournisseur"],
            ZoneStockage: produit["ZoneStockage"],
            dateAchat: produit["DateAchat"],
            name: produit["name"],
            dateExp: produit["DateExp"],
            category: produit["Category"],
            prixunigros: produit["prixunigros"],
            prixunisubgros: produit["prixunisubgros"],
            image: produit["image"],
            verss: produit["verss"]);
        Allproduits.add(produitObjet);
      }
    }
    print("aaaaaaaaaaaaaaaaaaaaaaaa ${Allproduits.length}");
    return Allproduits;
  }

  static Future<void> postproduct(
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
      base64Str,
      verss,
      context) async {
    String DateAchat = DateTime.now().toString();

    List<ProduitObj> Allproduits = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Produits/";

    final headerall = {'Content-Type': 'application/json'};
    final bodyall = convert.jsonEncode({
      "name": name,
      "PrixAchat": prixachat,
      "Fournisseur": Fournisseur,
      "ZoneStockage": ZoneStockage,
      "DateAchat": DateAchat,
      "prixunigros": prixunigros,
      "prixunisubgros": prixunisubgros,
      "cnttemblg": cnttemblg,
      "cntt": int.parse(cntt),
      "DateExp": DateExp,
      "Category": Category,
      "verss": verss,
      "image": base64Str
    });

    var res =
        await http.post(Uri.parse(uri), headers: headerall, body: bodyall);

    if (res.statusCode == 201) {
      for (var user
          in Provider.of<UserProv>(context, listen: false).AllaboutEmpl) {
        print("inventaire......................................");
        var uri1 =
            "http://${IpConfig.ipconfig}:3030/Api/v1/Inventaire/${user.name}";
        final headerall1 = {'Content-Type': 'application/json'};
        final bodyall1 = convert.jsonEncode({
          "name": name,
          "PrixAchat": prixachat,
          "UserId": user.name,
          "Fournisseur": Fournisseur,
          "ZoneStockage": ZoneStockage,
          "cntt": 0,
          "prixuni": prixunigros,
          "Category": Category,
          "image": base64Str
        });

        if (user.grade != "empl") {
          var res1 = await http.post(Uri.parse(uri1),
              headers: headerall1, body: bodyall1);
        }
      }

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
    }
  }

  static Future<void> updateQuntityInInventaire(
      idproduit, Newcntt, context) async {
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Inventaire/$idproduit";
    final headerall = {'Content-Type': 'application/json'};

    final bodyall = convert.jsonEncode({"cntt": Newcntt});
    final res =
        await http.put(Uri.parse(uri), headers: headerall, body: bodyall);
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
    }
  }

  static Future<void> deleteproduct(idproduit) async {
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Produits/$idproduit";

    final res = await http.delete(Uri.parse(uri));
  }
}
