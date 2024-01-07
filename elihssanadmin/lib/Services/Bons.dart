import 'dart:async';
import 'dart:convert' as convert;

import 'package:elihssanadmin/Data/IpConfig.dart';
import 'package:elihssanadmin/Objects/Bon.dart';
import 'package:elihssanadmin/Objects/Bons.dart';
import 'package:elihssanadmin/Providers/Clients.dart';
import 'package:elihssanadmin/Providers/Produits.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class BonsSer {
  static Future<void> Addbon(BonobjForADD bon, context) async {
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Bon/";
    final headerall = {'Content-Type': 'application/json'};
    final bodyall = convert.jsonEncode({
      "Designation": bon.Designation,
      "Prixuni": bon.Prixuni,
      "NBDV": bon.NBDV,
      "Quntity": bon.Quntity,
      "IdClient": bon.IdClient,
      "IdUser": "admin",
      "prixtotalbon": bon.Prixtotalbon,
    });

    List<String> Ids = bon.IdsProduit.split(",");
    List<String> cntts = bon.Quntity.split(",");
    List<String> Oldcntts = bon.OldQuntity.split(",");

    var res =
        await http.post(Uri.parse(uri), headers: headerall, body: bodyall);
    if (res.statusCode == 201) {
      if (bon.verssement == "") {
        bon.verssement = "0";
      }
      Provider.of<ClientsProv>(context, listen: false).updateClient(
          bon.IdClient,
          int.parse(bon.oldverss) + int.parse(bon.verssement),
          context);
      for (var i = 0; i < Ids.length - 1; i++) {
        print("ids are${Ids[i]}");
        print("new cntt are${int.parse(Oldcntts[i]) - int.parse(
              cntts[i],
            )}");
        await Provider.of<ProduitsProv>(context, listen: false).updateQuntity(
            Ids[i],
            int.parse(Oldcntts[i]) -
                int.parse(
                  cntts[i],
                ),
            context);
      }
    }
  }

  static Future<List<BonsObj>> getALlBons(User) async {
    List<BonsObj> Allbons = [];
    print("zzzzzzzz");
    var uri = "http://192.168.143.34:3030/Api/v1/Bon/$User";
    print(":::::::::");
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);

      for (var bon in jsonres) {
        print(bon["_id"].runtimeType);
        print(bon["Versemment"].runtimeType);
        print(bon["NBDV"].runtimeType);
        print(bon["Designation"].runtimeType);
        print(bon["Quntity"].runtimeType);
        print(bon["Prixuni"].runtimeType);

        BonsObj BonObjet = BonsObj(
            idUser: bon["IdUser"],
            date: bon["createdAt"],
            id: bon["_id"],
            NBDV: bon["NBDV"],
            Deignation: bon["Designation"],
            Quntity: bon["Quntity"],
            PrixUni: bon["Prixuni"],
            Prixtotalbon: bon["Prixtotalbon"]);

        Allbons.add(BonObjet);
      }
      print(
          "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz ${Allbons.length}");
    }
    return Allbons;
  }

  static Future<int> updatetbon(idbon, Versemment, context) async {
    int newverssement = Versemment;
    var id;
    var uri = "http://192.168.114.34:3030/Api/v1/Bon/updatebon/$idbon";
    final headerall = {'Content-Type': 'application/json'};

    final bodyall = convert.jsonEncode({"Versemment": Versemment});
    final res =
        await http.put(Uri.parse(uri), headers: headerall, body: bodyall);
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      newverssement = jsonres["Versemment"];

      Navigator.pop(context);
    }
    return newverssement;
  }

  static Future<List<BonsObj>> getAll() async {
    List<BonsObj> Allbons = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Bon/";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);

      for (var bon in jsonres) {
        BonsObj BonObjet = BonsObj(
            date: bon["createdAt"],
            id: bon["_id"],
            idUser: bon["IdUser"],
            NBDV: bon["NBDV"],
            Deignation: bon["Designation"],
            Quntity: bon["Quntity"],
            PrixUni: bon["Prixuni"],
            Prixtotalbon: bon["Prixtotalbon"]);

        Allbons.add(BonObjet);
      }
    }
    return Allbons;
  }

  static Future<void> deleteAllBonofClient(idclient) async {
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/bon/$idclient";
    var res = await http.delete(Uri.parse(uri));
  }

  static Future<void> updatetbonCntt(
      idbon, desgintation, cntt, prixuni, context) async {
    int Prixtotalbon = 0;
    for (var i = 0; i < desgintation.length - 1; i++) {
      Prixtotalbon = Prixtotalbon + int.parse(cntt[i]) * int.parse(prixuni[i]);
    }
    var uri =
        "http://${IpConfig.ipconfig}:3030/Api/v1/Bon/updatebonQuntity/$idbon";
    final headerall = {'Content-Type': 'application/json'};
    final bodyall = convert.jsonEncode({
      "Designation": desgintation,
      "Quntity": cntt,
      "Prixuni": prixuni,
      "Prixtotalbon": Prixtotalbon
    });
    final res =
        await http.put(Uri.parse(uri), headers: headerall, body: bodyall);
    if (res.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Center(
            child: Text(
          "Bon Updated",
          style: TextStyle(fontSize: 22),
        )),
        backgroundColor: const Color.fromARGB(255, 240, 80, 133),
        duration: Duration(seconds: 2),
      ));
      await Provider.of<ClientsProv>(context, listen: false)
          .getAllAboutClients();
    }
  }

  static Future<List<BonsObj>> getALlBonsOfUser(User) async {
    List<BonsObj> Allbons = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Bon/$User";
    var res = await http.get(Uri.parse(uri));
    print("oooooooooooooooooooooooooo ${res.statusCode}");
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);

      for (var bon in jsonres) {
        BonsObj BonObjet = BonsObj(
            date: bon["createdAt"],
            id: bon["_id"],
            idUser: bon["IdUser"],
            NBDV: bon["NBDV"],
            Deignation: bon["Designation"],
            Quntity: bon["Quntity"],
            PrixUni: bon["Prixuni"],
            Prixtotalbon: bon["Prixtotalbon"]);

        Allbons.add(BonObjet);
      }
    }
    return Allbons;
  }

  static Future<List<BonsObj>> GetAllBonOfClient(idClient) async {
    List<BonsObj> Allbons = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Bon/client/$idClient";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      for (var bon in jsonres) {
        BonsObj BonObjet = BonsObj(
            date: bon["createdAt"],
            id: bon["_id"],
            idUser: bon["IdUser"],
            NBDV: bon["NBDV"],
            Deignation: bon["Designation"],
            Quntity: bon["Quntity"],
            PrixUni: bon["Prixuni"],
            Prixtotalbon: bon["Prixtotalbon"]);

        Allbons.add(BonObjet);
      }
    }
    return Allbons;
  }
}
