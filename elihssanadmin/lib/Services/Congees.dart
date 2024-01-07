import 'dart:convert' as convert;

import 'package:elihssanadmin/Data/IpConfig.dart';
import 'package:elihssanadmin/Objects/Congees.dart';
import 'package:http/http.dart' as http;

class CongeesSer {
  static Future<List<CongeesObj>> getAllcongesOfUser(user) async {
    List<CongeesObj> AllCongges = [];

    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Congee/$user";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);
      for (var congee in jsonres) {
        CongeesObj congeeobj = CongeesObj(
          id: congee["_id"],
          arrivee: congee["arrivee"],
          depart: congee["depart"],
        );

        AllCongges.add(congeeobj);
      }
    }
    return AllCongges;
  }

  static Future<void> AddDateArvOfCurrentCongee(user) async {
    var uri =
        "http://${IpConfig.ipconfig}:3030/Api/v1/Congee/currentcongee/$user";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {}
  }

  static Future<void> AddDateDepart(user) async {
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Congee/";
    final headerall = {'Content-Type': 'application/json'};
    final bodyall = convert.jsonEncode({"UserId": user});
    var res =
        await http.post(Uri.parse(uri), headers: headerall, body: bodyall);
  }
}
