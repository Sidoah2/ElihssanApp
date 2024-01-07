import 'package:elihssanadmin/Objects/ArticlePropo_objet.dart';
import 'package:elihssanadmin/Services/Articles.dart';
import 'package:flutter/material.dart';

class ArticlePropoProv extends ChangeNotifier {
  List<ArticlePropoObj> _AllArticles = [];
  List<ArticlePropoObj> get AllArticles => _AllArticles;
  Future<void> getAllArticles() async {
    _AllArticles = await ArticlesSer.getAllArticles();
    notifyListeners();
  }

  Future<void> AddArticles(obs, nameproduit, image, context, User) async {
    await ArticlesSer.postArticle(obs, nameproduit, image, context, User);
    await getAllArticles();
  }

  Future<void> deleteArticles(idarticle) async {
    await ArticlesSer.DeletsArticles(idarticle);
    await getAllArticles();
  }
}
