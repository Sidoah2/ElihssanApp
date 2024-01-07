import 'dart:convert' as convert;

import 'package:elihssanadmin/Data/IpConfig.dart';
import 'package:elihssanadmin/Objects/Allaboutclient.dart';
import 'package:elihssanadmin/Objects/Bons.dart';
import 'package:elihssanadmin/Objects/Clients.dart';
import 'package:elihssanadmin/Services/Bons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClientsServ {
  static Future<List<ClientObj>> getAllclients() async {
    List<ClientObj> Allclients = [];

    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/ClientS/";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      for (var client in jsonres) {
        ClientObj clientObjet = ClientObj(
            id: client["_id"],
            name: client["name"],
            IdUser: client["IdUser"],
            adress: client["adresseMagasin"],
            verss: client["verss"].toString(),
            contact: client["phone"].toString(),
            region: client["region"],
            remarques: client["remarques"]);

        Allclients.add(clientObjet);
      }
    }
    return Allclients;
  }

  static Future<List<ClientObj>> getAllclientsOfUsr(IdUser) async {
    List<ClientObj> AllclientsOfUser = [];

    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/ClientS/$IdUser";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      for (var client in jsonres) {
        ClientObj clientObjet = ClientObj(
            id: client["_id"],
            name: client["name"],
            IdUser: client["IdUser"],
            adress: client["adresseMagasin"],
            verss: client["verss"].toString(),
            contact: client["phone"].toString(),
            region: client["region"],
            remarques: client["remarques"]);

        AllclientsOfUser.add(clientObjet);
      }
    }
    return AllclientsOfUser;
  }

  static Future<List<AllAboutClientObjet>> getAllAboutclients() async {
    List<AllAboutClientObjet> allAboutClients = [];
    List<ClientObj> AllClients = await getAllclients();
    for (var client in AllClients) {
      List<BonsObj> bons = await BonsSer.GetAllBonOfClient(client.id);
      AllAboutClientObjet aboutClientObjet =
          AllAboutClientObjet(client: client, bons: bons);
      allAboutClients.add(aboutClientObjet);
    }
    return allAboutClients;
  }

  static Future<void> updateClient(idClient, Versemment, context) async {
    var uri =
        "http://${IpConfig.ipconfig}:3030/Api/v1/ClientS/updateverss/$idClient";
    final headerall = {'Content-Type': 'application/json'};

    final bodyall = convert.jsonEncode({"verss": Versemment});
    final res =
        await http.put(Uri.parse(uri), headers: headerall, body: bodyall);
    if (res.statusCode == 200) {
      Navigator.pop(context);
    }
  }

  static Future<void> AddClient(name, phone, map, magasin, region, remarques,
      dattesAnc, verss, User) async {
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/ClientS/";
    final headerall = {'Content-Type': 'application/json'};
    final bodyall = convert.jsonEncode({
      "name": name,
      "IdUser": User,
      "phone": phone,
      "adresseMagasin": magasin,
      "adresseMap": map,
      "region": region,
      "remarques": remarques,
      "verss": verss,
      "dattesAnciennes": dattesAnc
    });

    var res =
        await http.post(Uri.parse(uri), headers: headerall, body: bodyall);

    if (res.statusCode == 201) {}
  }
}
