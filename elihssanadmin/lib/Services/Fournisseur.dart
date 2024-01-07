import 'dart:convert' as convert;

import 'package:elihssanadmin/Data/IpConfig.dart';
import 'package:elihssanadmin/Objects/Allaboutfournisseur.dart';
import 'package:elihssanadmin/Objects/Fournisseur.dart';
import 'package:elihssanadmin/Objects/produit.dart';
import 'package:elihssanadmin/Services/Produits.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FournisseursSer {
  static Future<List<FournisseurObj>> getAllfournisseurs() async {
    List<FournisseurObj> AllFournisseur = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Fournisseur/";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      for (var client in jsonres) {
        FournisseurObj fournisseurObjet = FournisseurObj(
            dattes: client["dattesAnciennes"].toString(),
            id: client["_id"],
            name: client["name"],
            verss: client["verss"],
            adressmap: client["adresseMap"],
            adressfournisseur: client["adresseFournisseur"],
            contact: client["phone"].toString(),
            region: client["region"],
            remarques: client["remarques"]);

        AllFournisseur.add(fournisseurObjet);
      }
    }
    return AllFournisseur;
  }

  static Future<void> postfournisseue(name, phone, adressfournisseur, adressmap,
      region, remarques, dattesAnc, context) async {
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Fournisseur/";
    final headerall = {'Content-Type': 'application/json'};
    final bodyall = convert.jsonEncode({
      "name": name,
      "phone": phone,
      "adresseFournisseur": adressfournisseur,
      "adresseMap": adressmap,
      "region": region,
      "verss": 0,
      "remarques": remarques,
      "dattesAnciennes": dattesAnc
    });

    var res =
        await http.post(Uri.parse(uri), headers: headerall, body: bodyall);
    if (res.statusCode == 201) {
      Navigator.pop(context);
    }
  }

  static Future<List<AllAboutFournisseurObj>> getAllAboutfournisseurs() async {
    List<AllAboutFournisseurObj> allAboutFournisseur = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Fournisseur/";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      for (var client in jsonres) {
        FournisseurObj fournisseurObjet = FournisseurObj(
            dattes: client["dattesAnciennes"].toString(),
            id: client["_id"],
            name: client["name"],
            verss: client["verss"],
            adressmap: client["adresseMap"],
            adressfournisseur: client["adresseFournisseur"],
            contact: client["phone"].toString(),
            region: client["region"],
            remarques: client["remarques"]);

        List<ProduitObj> produits =
            await ProduitsSer.getAllproductDeFournisseur(client["name"]);
        AllAboutFournisseurObj aboutFournisseurObjet = AllAboutFournisseurObj(
            fournisseur: fournisseurObjet, produits: produits);
        allAboutFournisseur.add(aboutFournisseurObjet);
      }
    }
    return allAboutFournisseur;
  }

  // static Future<void> deleteclient(idclient) async {
  //   print("zzzzzzzz");
  //   var uri = "http://192.168.143.34:3030/Api/v1/ClientS/$idclient";
  //   var res = await http.delete(Uri.parse(uri));
  // }
  static Future<void> updateverss(idfournisseur, verss, context) async {
    var uri =
        "http://${IpConfig.ipconfig}:3030/Api/v1/Fournisseur/updateverss/$idfournisseur";
    final headerall = {'Content-Type': 'application/json'};
    print("the id is $idfournisseur");
    final bodyall = convert.jsonEncode({"verss": verss});
    final res =
        await http.put(Uri.parse(uri), headers: headerall, body: bodyall);
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);

      Navigator.pop(context);
    }
  }
}
