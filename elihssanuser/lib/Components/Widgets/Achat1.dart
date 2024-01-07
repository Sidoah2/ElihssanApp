import 'package:elihssanuser/Components/Affichage/Achat1Affichage.dart';
import 'package:elihssanuser/Components/ButtomNav/Achat1Nav.dart';
import 'package:elihssanuser/Objects/Allaboutfournisseur.dart';
import 'package:flutter/material.dart';

class Achat1 extends StatelessWidget {
  AllAboutFournisseurObj allProduits;
  int prixtotal;

  Achat1(this.allProduits, this.prixtotal);

  List<String> Titres = ["Produits", "Date", "Prix d'achat", "Quntity"];
  int prixtotalVers = 0;

  @override
  Widget build(BuildContext contextg) {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        allProduits.fournisseur.name,
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: Titres.map((e) => Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e,
                            textAlign: TextAlign.center,
                          ),
                        )))).toList(),
              ),
              const Divider(
                color: Colors.black,
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: allProduits.produits.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.002),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                              onPressed: () async {
                                                // await Provider.of<ProduitsProv>(
                                                //         context,
                                                //         listen: false)
                                                //     .DeleteProduit(allProduits
                                                //         .produits[index].id);
                                              },
                                              icon: Icon(
                                                Icons.delete_outline,
                                                color: Colors.red,
                                              )),
                                          Text(
                                            "${allProduits.produits[index].name}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${allProduits.produits[index].dateAchat.substring(0, 10)}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${allProduits.produits[index].PrixAchat}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${allProduits.produits[index].cntt}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )))
                            ],
                          ));
                    },
                  ),
                ),
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black38,
              ),
              Achat1Affichage(
                prixTotal: prixtotal,
              ),
              Container(
                child: Achat1Nav(contextg, allProduits, prixtotal),
              )
            ],
          ),
        ),
      )),
    );
  }
}
