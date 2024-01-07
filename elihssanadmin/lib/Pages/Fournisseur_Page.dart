import 'package:elihssanadmin/Components/ButtomNav/FournisseurNav.dart';
import 'package:elihssanadmin/Providers/Fournisseur.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Fournisseur extends StatelessWidget {
  Fournisseur({super.key});
  List<String> Titres = [
    "Clients",
    "Region",
    "Adresse",
    "Contact",
    "Montant Total",
    "Montant Payé",
    "Montant restant",
    "Remarques"
  ];
  List<int> prixtotals = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Scaffold(body: Consumer<FournisseursProv>(
        builder: (context, fournisseursProv, child) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.002,
                horizontal: MediaQuery.of(context).size.width * 0.02),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: Colors.black,
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
                  Divider(
                    color: Colors.black,
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: fournisseursProv.AllAboutFournisseur.length,
                        itemBuilder: (context, index) {
                          for (var fournisseur
                              in fournisseursProv.AllAboutFournisseur) {
                            int prix = 0;
                            for (var produit in fournisseur.produits) {
                              prix = prix +
                                  produit.cntt * int.parse(produit.PrixAchat);
                            }
                            prixtotals.add(prix);
                          }
                          return Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.002),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${fournisseursProv.AllAboutFournisseur[index].fournisseur.name}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${fournisseursProv.AllAboutFournisseur[index].fournisseur.region}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${fournisseursProv.AllAboutFournisseur[index].fournisseur.adressfournisseur}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${fournisseursProv.AllAboutFournisseur[index].fournisseur.contact}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${prixtotals[index]}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${fournisseursProv.AllAboutFournisseur[index].fournisseur.verss}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${prixtotals[index] - fournisseursProv.AllAboutFournisseur[index].fournisseur.verss}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${fournisseursProv.AllAboutFournisseur[index].fournisseur.remarques}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                ],
                              ));
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: FournisseurNav(context),
                  )
                ],
              ),
            ),
          );
        },
      ))),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ListView.builder(
//                       itemCount: ArticlObjet.StaticArticles.length,
//                       itemBuilder: (context, index) {
//                         return Expanded(
//                           child: Container(
//                               padding: EdgeInsets.all(
//                                   MediaQuery.of(context).size.height * 0.002),
//                               alignment: Alignment.center,
//                               child: Row(
//                                 children: [
//                                   Expanded(
//                                       child: InkWell(
//                                     onTap: () {
//                                       // Navigator.push(
//                                       //     context,
//                                       //     MaterialPageRoute(
//                                       //       builder: (context) =>
//                                       //           ClientVentPage(),
//                                       //     ));
//                                     },
//                                     child: Container(
//                                         padding: EdgeInsets.all(5),
//                                         alignment: Alignment.center,
//                                         child: Text(
//                                           ArticlObjet
//                                               .StaticArticles[index].Deignation,
//                                           style: const TextStyle(
//                                               fontSize: 15,
//                                               fontWeight: FontWeight.w500),
//                                         )),
//                                   )),
//                                   Expanded(
//                                       child: Container(
//                                           alignment: Alignment.center,
//                                           child: Text(
//                                             ArticlObjet
//                                                 .StaticArticles[index].Quntity
//                                                 .toString(),
//                                             style: const TextStyle(
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.w500),
//                                           ))),
//                                   Expanded(
//                                       child: Container(
//                                           alignment: Alignment.center,
//                                           child: Text(
//                                             ArticlObjet
//                                                 .StaticArticles[index].PrixUni
//                                                 .toString(),
//                                             style: const TextStyle(
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.w500),
//                                           ))),
//                                   Expanded(
//                                       child: Container(
//                                           alignment: Alignment.center,
//                                           child: Text(
//                                             ArticlObjet
//                                                 .StaticArticles[index].Total
//                                                 .toString(),
//                                             style: const TextStyle(
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.w500),
//                                           )))
//                                 ],
//                               )),
//                         );
//                       },
//                     ),