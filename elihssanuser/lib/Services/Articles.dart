import 'dart:async';
import 'dart:convert' as convert;

import 'package:elihssanuser/Data/IpConfig.dart';
import 'package:elihssanuser/Objects/ArticlePropo_objet.dart';
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

    var res =
        await http.post(Uri.parse(uri), headers: headerall, body: bodyall);
  }

  static Future<List<ArticlePropoObj>> getAllArticles(IdUser) async {
    List<ArticlePropoObj> AllArticles = [];
    var uri = "http://${IpConfig.ipconfig}:3030/Api/v1/Articles/$IdUser";
    var res = await http.get(Uri.parse(uri));
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
