import 'package:elihssanadmin/Components/ButtomNav/StockNav.dart';
import 'package:elihssanadmin/Components/Searches/StockSer.dart';
import 'package:elihssanadmin/Providers/Produits.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StockPage extends StatelessWidget {
  List<String> Titres = [
    "Category",
    "Produit",
    "Date d'achat",
    "Prix d'achat",
    "Quntity en stock",
    "Zone de stockage",
    "Date d'Exp",
    "Prix de Vent",
    "Fournisseur"
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
                                child: Row(
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      await produitprov.DeleteProduit(
                                          produitprov.Allproduits[index].id);
                                    },
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    )),
                                Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].category}"),
                              ],
                            )),
                            Expanded(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].name}")),
                            Expanded(
                              child: Text(
                                  textAlign: TextAlign.center,
                                  "${produitprov.Allproduits[index].dateAchat.substring(0, 10)}"),
                            ),
                            Expanded(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].PrixAchat}")),
                            Expanded(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].cntt}")),
                            Expanded(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].ZoneStockage}")),
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
                            Expanded(
                                child: Text(
                              textAlign: TextAlign.center,
                              "${produitprov.Allproduits[index].prixunigros}",
                            )),
                            Expanded(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].Fournisseur}")),
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
