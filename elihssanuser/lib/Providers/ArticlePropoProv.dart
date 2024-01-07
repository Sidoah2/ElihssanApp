import 'package:elihssanuser/Objects/ArticlePropo_objet.dart';
import 'package:elihssanuser/Services/Articles.dart';
import 'package:flutter/material.dart';

class ArticlePropoProv extends ChangeNotifier {
  List<ArticlePropoObj> _AllArticles = [];
  List<ArticlePropoObj> get AllArticles => _AllArticles;
  Future<void> getAllArticles(IdUser) async {
    _AllArticles = await ArticlesSer.getAllArticles(IdUser);
    notifyListeners();
  }

  Future<void> AddArticles(obs, nameproduit, image, context, User) async {
    await ArticlesSer.postArticle(obs, nameproduit, image, context, User);
    await getAllArticles(User);
  }

  Future<void> deleteArticles(idarticle, IdUser) async {
    await ArticlesSer.DeletsArticles(idarticle);
    await getAllArticles(IdUser);
  }
}
