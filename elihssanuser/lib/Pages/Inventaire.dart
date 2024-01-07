import 'dart:convert';

import 'package:elihssanuser/Components/ButtomNav/InventaireNav.dart';
import 'package:elihssanuser/Objects/Inventaire.dart';
import 'package:elihssanuser/Providers/Inventaire.dart';
import 'package:elihssanuser/Providers/Localdb.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvetairePage extends StatefulWidget {
  @override
  State<InvetairePage> createState() => _InvetairePageState();
}

class _InvetairePageState extends State<InvetairePage> {
  var cnttcntrl = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // for (var produit
    //     in Provider.of<ProduitsProv>(context, listen: false).Allproduits) {
    //   Provider.of<InventairesProv>(context, listen: false).PostInventaire(
    //       produit.image,
    //       produit.name,
    //       produit.prixuni,
    //       0,
    //       produit.dateExp,
    //       produit.category,
    //       produit.id,
    //       context);
    // }
  }

  List ids = [];

  @override
  Widget build(BuildContext context) {
    for (var produit
        in Provider.of<InventaireProv>(context, listen: false).Allproduits) {
      ids.add(produit.id);
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(body: Consumer<InventaireProv>(
            builder: (ctx1, invProduit, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: invProduit.Allproduits.length,
                        itemBuilder: (context, index) {
                          return CardInv(
                              invProduit.Allproduits[index], context);
                        },
                      ),
                    ),
                  ),
                  // ButtomInv(cntx: context)
                  Container(
                    child: InventaireNav(context),
                  )
                ],
              );
            },
          )),
        ));
  }

  CardInv(InventaireObj Produit, context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(),
            boxShadow: [
              BoxShadow(blurRadius: 1, color: Colors.white, spreadRadius: 2)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text("${Produit.name}"),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Quntity :${Produit.cntt}"),
                  Text("Prix Unitaire :${Produit.prixuni}"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Image.memory(base64Decode(Produit.image)),
              InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Wrap(
                          children: [
                            TextField(
                              controller: cnttcntrl,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  label: Text("Quntity")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () async {
                                  // updateQuntityInInventaire
                                  print("id ${Produit.id}");
                                  Provider.of<InventaireProv>(context,
                                          listen: false)
                                      .updateQuntityInInventaire(
                                          Produit.id,
                                          int.parse(cnttcntrl.text),
                                          Provider.of<LocaldbProv>(context,
                                                  listen: false)
                                              .User,
                                          context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [Colors.pink, Colors.white])),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Save"),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text("Modifier"))
            ],
          ),
        ),
      ),
    );
  }
}
