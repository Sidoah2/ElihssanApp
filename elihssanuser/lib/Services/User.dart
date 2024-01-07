import 'dart:convert' as convert;

import 'package:elihssanuser/Data/IpConfig.dart';
import 'package:http/http.dart' as http;

class USerServ {
  var ipcpnfig = "192.168.143.34";

  static Future<void> postuser(name, lieu) async {
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/User/";
    final headerall = {'Content-Type': 'application/json'};
    final bodyall =
        convert.jsonEncode({"name": name, "lieu": lieu, "grade": "user"});
    var res =
        await http.post(Uri.parse(uri), headers: headerall, body: bodyall);
  }
}
