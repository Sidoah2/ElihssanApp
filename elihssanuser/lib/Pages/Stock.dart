import 'package:elihssanuser/Components/ButtomNav/StockNav.dart';
import 'package:elihssanuser/Components/Searches/StockSer.dart';
import 'package:elihssanuser/Providers/Produits.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StockPage extends StatelessWidget {
  List<String> Titres = [
    "Category",
    "Produit",
    "Quntity en stock",
    "Date d'Exp",
  ];
  @override
  Widget build(BuildContext context) {
    var TimeNow = DateTime.now();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  child: StockSer(),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                children: Titres.map((e) => Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(
                        "$e",
                        textAlign: TextAlign.center,
                      ),
                    ))).toList(),
              ),
              Divider(
                color: Colors.black,
              ),
              Expanded(
                child: Consumer<ProduitsProv>(
                  builder: (ctx, produitprov, child) {
                    return ListView.builder(
                      itemCount: produitprov.Allproduits.length,
                      itemBuilder: (ctx1, index) {
                        DateTime dateTime;
                        var cmp;
                        if (produitprov.Allproduits[index].dateExp != "") {
                          dateTime = DateTime(
                              int.parse(produitprov.Allproduits[index].dateExp
                                  .substring(6, 10)),
                              int.parse(produitprov.Allproduits[index].dateExp
                                  .substring(3, 5)),
                              int.parse(produitprov.Allproduits[index].dateExp
                                  .substring(0, 2)));
                          cmp = DateTime.now().compareTo(dateTime);
                          print(DateTime.now());
                          print(cmp);
                        } else {
                          dateTime = DateTime(0);
                        }

                        return Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(children: [
                            Expanded(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].category}")),
                            Expanded(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].name}")),
                            Expanded(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].cntt}")),
                            Expanded(
                              child: dateTime.year != 0
                                  ? cmp == -1
                                      ? Text(
                                          textAlign: TextAlign.center,
                                          "${dateTime.year}/${dateTime.month}/${dateTime.day}",
                                          style: TextStyle(color: Colors.green),
                                        )
                                      : Text(
                                          textAlign: TextAlign.center,
                                          "${dateTime.year}/${dateTime.month}/${dateTime.day}",
                                          style: TextStyle(color: Colors.red))
                                  : Text(
                                      "/",
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                          ]),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                child: StockNav(context),
              )
            ],
          ),
        ),
      )),
    );
  }
}
