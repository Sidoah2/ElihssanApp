import 'package:elihssanuser/Components/ButtomNav/ListInventaireNav.dart';
import 'package:elihssanuser/Objects/Inventaire.dart';
import 'package:elihssanuser/Providers/Inventaire.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListInventaire extends StatefulWidget {
  @override
  State<ListInventaire> createState() => _ListInventaireState();
}

class _ListInventaireState extends State<ListInventaire> {
  List<String> Titres = ["Category", "Produit", "Quntity"];

  int total = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var produit
        in Provider.of<InventaireProv>(context, listen: false).Allproduits) {
      if (produit.isupdated) {
        total = total + 1;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Divider(),
              Row(
                children: Titres.map((e) => Expanded(
                        child: Text(
                      "$e",
                      textAlign: TextAlign.center,
                    ))).toList(),
              ),
              Divider(),
              Expanded(
                child: Consumer<InventaireProv>(
                  builder: (context, inventaireProv, child) {
                    List<InventaireObj> produits = [];
                    for (var produit in inventaireProv.Allproduits) {
                      if (produit.isupdated) {
                        produits.add(produit);
                      }
                    }
                    return ListView.builder(
                      itemCount: produits.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                                child: Text(
                              "${produits[index].category}",
                              textAlign: TextAlign.center,
                            )),
                            Expanded(
                                child: Text("${produits[index].name}",
                                    textAlign: TextAlign.center)),
                            Expanded(
                                child: Text("${produits[index].cntt}",
                                    textAlign: TextAlign.center))
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text("Total Produits :"), Text("${total}")],
                  ),
                ),
              ),
              Container(
                child: ListInventaireNav(context),
              )
            ],
          ),
        ),
      )),
    );
  }
}
