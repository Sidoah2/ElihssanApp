import 'dart:async';
import 'dart:convert' as convert;

import 'package:elihssanadmin/Data/IpConfig.dart';
import 'package:elihssanadmin/Objects/ArticlePropo_objet.dart';
import 'package:http/http.dart' as http;

class ArticlesSer {
  var ipcpnfig = "192.168.143.34";
  static Future<void> postArticle(
      observation, nameproduit, image, context, User) async {
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Articles/$User";
    final headerall = {'Content-Type': 'application/json'};
    final bodyall = convert.jsonEncode({
      "observation": observation,
      "nameproduit": nameproduit,
      "image": image
    });

    print("mmmmmmmmmmmmmm");
    var res =
        await http.post(Uri.parse(uri), headers: headerall, body: bodyall);
    print("wwwwwwww");
    if (res.statusCode == 201) {
      print("posted wwwwwwwww");
    }
  }

  static Future<List<ArticlePropoObj>> getAllArticles() async {
    List<ArticlePropoObj> AllArticles = [];
    print("zzzzzzzz");
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Articles/";
    print(":::::::::");
    var res = await http.get(Uri.parse(uri));
    print("::::::::::::: ${res.statusCode}");
    if (res.statusCode == 200) {
      var jsonres = convert.jsonDecode(res.body);

      for (var article in jsonres) {
        ArticlePropoObj articleObjet = ArticlePropoObj(
          nameproduit: article["nameproduit"],
          id: article["_id"],
          image: article["image"],
          obs: article["observation"],
        );

        AllArticles.add(articleObjet);
      }
    }
    return AllArticles;
  }

  static Future<void> DeletsArticles(idarticle) async {
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Articles/$idarticle";

    var res = await http.delete(Uri.parse(uri));
  }
}

//   static Future<int> updatetbon(idbon, Versemment, context) async {
//     int newverssement = Versemment;
//     var id;
//     var uri = "http://192.168.114.34:3030/Api/v1/Bon/updatebon/$idbon";
//     final headerall = {'Content-Type': 'application/json'};

//     final bodyall = convert.jsonEncode({"Versemment": Versemment});
//     final res =
//         await http.put(Uri.parse(uri), headers: headerall, body: bodyall);
//     if (res.statusCode == 200) {
//       var jsonres = convert.jsonDecode(res.body);
//       newverssement = jsonres["Versemment"];

//       Navigator.pop(context);
//     }
//     return newverssement;
  
// }
