import 'dart:convert' as convert;

import 'package:elihssanadmin/Data/IpConfig.dart';
import 'package:elihssanadmin/Objects/Bons.dart';
import 'package:elihssanadmin/Objects/Clients.dart';
import 'package:elihssanadmin/Objects/Congees.dart';
import 'package:elihssanadmin/Objects/Depense.dart';
import 'package:elihssanadmin/Objects/User.dart';
import 'package:elihssanadmin/Services/Bons.dart';
import 'package:elihssanadmin/Services/Clients.dart';
import 'package:elihssanadmin/Services/Congees.dart';
import 'package:elihssanadmin/Services/Depenses.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class USerServ {
  var ipcpnfig = "192.168.143.34";

  static Future<List<UserObj>> getAllAboutUsers() async {
    List<UserObj> AllAboutUsers = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/User/";

    var res = await http.get(Uri.parse(uri));

    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      for (var user in jsonres) {
        List<DepenseObj> depensesofuser =
            await DepensesSer.getAlldepensesOfUser(user["name"]);

        List<BonsObj> Bonsofuser = await BonsSer.getALlBonsOfUser(user["name"]);

        List<ClientObj> ClientsOfUser =
            await ClientsServ.getAllclientsOfUsr(user["name"]);
        List<CongeesObj> Congees =
            await CongeesSer.getAllcongesOfUser(user["name"]);

        UserObj userObjet = UserObj(
            grade: user["grade"],
            congees: Congees,
            id: user["_id"],
            name: user["name"],
            daterec: user["daterec"],
            lieu: user["lieu"],
            salairej: user["salairej"],
            bons: Bonsofuser,
            depenses: depensesofuser,
            clients: ClientsOfUser);
        AllAboutUsers.add(userObjet);
      }
    }
    return AllAboutUsers;
  }

  static Future<List<UserObj>> getAllEmpl() async {
    List<UserObj> AllAboutUsers = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/User/empl";

    var res = await http.get(Uri.parse(uri));

    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      for (var user in jsonres) {
        List<DepenseObj> depensesofuser =
            await DepensesSer.getAlldepensesOfUser(user["name"]);

        List<BonsObj> Bonsofuser = await BonsSer.getALlBonsOfUser(user["name"]);

        List<ClientObj> ClientsOfUser =
            await ClientsServ.getAllclientsOfUsr(user["name"]);
        List<CongeesObj> Congees =
            await CongeesSer.getAllcongesOfUser(user["name"]);
        UserObj userObjet = UserObj(
            grade: user["grade"],
            congees: Congees,
            id: user["_id"],
            name: user["name"],
            daterec: user["daterec"],
            lieu: user["lieu"],
            salairej: user["salairej"],
            bons: Bonsofuser,
            depenses: depensesofuser,
            clients: ClientsOfUser);
        AllAboutUsers.add(userObjet);
      }
    }
    return AllAboutUsers;
  }

  static Future<void> AddEmpl(name, lieu, context) async {
    print("zzzzzzzz");
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/User/";
    final headerall = {'Content-Type': 'application/json'};
    final bodyall =
        convert.jsonEncode({"name": name, "lieu": lieu, "grade": "empl"});
    var res =
        await http.post(Uri.parse(uri), headers: headerall, body: bodyall);
    if (res.statusCode == 201) {
      Navigator.pop(context);
    }
  }

  static Future<int> updateempl(idempl, daterec, salairej, context) async {
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/User/$idempl";

    final headerall = {'Content-Type': 'application/json'};

    final bodyall =
        convert.jsonEncode({"daterec": daterec, "salairej": salairej});
    final res =
        await http.put(Uri.parse(uri), headers: headerall, body: bodyall);
    return res.statusCode;
  }

  static Future<void> postadmin(name, lieu) async {
    print("zzzzzzzz");
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/User/";
    final headerall = {'Content-Type': 'application/json'};
    final bodyall =
        convert.jsonEncode({"name": name, "lieu": lieu, "grade": "admin"});
    var res =
        await http.post(Uri.parse(uri), headers: headerall, body: bodyall);
    if (res.statusCode == 201) {
      print("posted");
    }
  }

  static Future<int> getadmin() async {
    int admin = 0;
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/User/admin";

    var res = await http.get(Uri.parse(uri));

    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      if (jsonres.length != 0) {
        admin = 1;
      } else {
        await postadmin("admin", "admin");
      }
    }
    return admin;
  }
}
