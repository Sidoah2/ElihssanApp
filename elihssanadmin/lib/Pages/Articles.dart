import 'dart:convert';

import 'package:elihssanadmin/Components/ButtomNav/BottomArticle%20copy.dart';
import 'package:elihssanadmin/Providers/ArticlePropoProv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Article extends StatefulWidget {
  Article({super.key});

  @override
  State<Article> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Consumer<ArticlePropoProv>(
                  builder: (context, value, child) {
                    return Container(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemCount: value.AllArticles.length,
                        itemBuilder: (context, index) {
                          return ArticleDesign(
                              value.AllArticles[index].image,
                              value.AllArticles[index].nameproduit,
                              value.AllArticles[index].obs,
                              value.AllArticles[index].id);
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: ButtomArticle(cntx: context),
              ),
            ],
          ),
        ),
      )),
    );
  }

  ArticleDesign(image, name, obs, id) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.memory(base64Decode(image),
                  fit: BoxFit.fill, height: double.infinity),
            ),
            Positioned(child: Text("$name\n$obs")),
          ],
        ),
      ),
    );
  }
}
