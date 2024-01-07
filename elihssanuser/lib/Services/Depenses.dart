import 'dart:async';
import 'dart:convert' as convert;

import 'package:elihssanuser/Data/IpConfig.dart';
import 'package:elihssanuser/Objects/Depense.dart';
import 'package:http/http.dart' as http;

class DepensesSer {
  static Future<void> postdepense(Category, Montant, User, type) async {
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Depenses/";
    final headerall = {'Content-Type': 'application/json'};
    final bodyall = convert.jsonEncode(
        {"Category": Category, "Montant": Montant, "User": User, "type": type});

    var res =
        await http.post(Uri.parse(uri), headers: headerall, body: bodyall);
    if (res.statusCode == 201) {}
  }

  static Future<List<DepenseObj>> getAlldepenses(user) async {
    List<DepenseObj> Alldepenses = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Depenses/$user";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      for (var depense in jsonres) {
        DepenseObj clientObjet = DepenseObj(
            id: depense["_id"],
            User: depense["User"],
            type: depense["type"],
            montant: depense["Montant"],
            category: depense["Category"],
            date: depense["createdAt"]);

        Alldepenses.add(clientObjet);
      }
    }
    return Alldepenses;
  }

  static Future<List<DepenseObj>> getAlldepensesOfUser(User) async {
    List<DepenseObj> Alldepenses = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Depenses/$User";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      for (var depense in jsonres) {
        DepenseObj clientObjet = DepenseObj(
            User: User,
            id: depense["_id"],
            type: depense["type"],
            montant: depense["Montant"],
            category: depense["Category"],
            date: depense["createdAt"]);

        Alldepenses.add(clientObjet);
      }
    }
    return Alldepenses;
  }
}
