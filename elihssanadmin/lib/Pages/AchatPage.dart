import 'package:elihssanadmin/Components/Affichage/AchatPageAffichage.dart';
import 'package:elihssanadmin/Components/ButtomNav/AchatPage.dart';
import 'package:elihssanadmin/Components/Widgets/Achat1.dart';
import 'package:elihssanadmin/Providers/Fournisseur.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AchatPage extends StatefulWidget {
  AchatPage({super.key});

  @override
  State<AchatPage> createState() => _VentVersemmentPAgeState();
}

class _VentVersemmentPAgeState extends State<AchatPage> {
  List<String> Titres = [
    "Fournisseur",
    "Adress",
    "Montant Total",
    "Montant Payé",
    "Montant restant"
  ];

  @override
  Widget build(BuildContext contextg) {
    List<int> prixtotals = [];
    int allverss = 0;
    int allprixtotal = 0;
    return MaterialApp(
      home: SafeArea(child: Scaffold(body: Consumer<FournisseursProv>(
        builder: (context, fournisseursProv, child) {
          for (var fournisseur in fournisseursProv.AllAboutFournisseur) {
            int verss = 0;
            allverss = allverss + fournisseur.fournisseur.verss;
            int prix = 0;
            for (var produit in fournisseur.produits) {
              prix = prix + produit.cntt * int.parse(produit.PrixAchat);
              allprixtotal =
                  allprixtotal + produit.cntt * int.parse(produit.PrixAchat);
            }
            prixtotals.add(prix);
          }
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.002,
                horizontal: MediaQuery.of(context).size.width * 0.02),
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
                        return Container(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.002),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    print(allverss);
                                    // print(
                                    //     "object ${allFournisseur[index].produits.length}");
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Achat1(
                                              fournisseursProv
                                                  .AllAboutFournisseur[index],
                                              prixtotals[index]),
                                        ));
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${fournisseursProv.AllAboutFournisseur[index].fournisseur.name}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )),
                                )),
                                Expanded(
                                    child: Container(
                                        padding: EdgeInsets.all(5),
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
                                        )))
                              ],
                            ));
                      },
                    ),
                  ),
                ),
                AchatPageAffichage(
                    prixTotal: allprixtotal, verssement: allverss),
                Container(
                    child: AchatPageNav(
                        contextg,
                        fournisseursProv.AllAboutFournisseur,
                        prixtotals,
                        Provider.of<FournisseursProv>(context, listen: false)
                            .AllAboutFournisseur
                            .length,
                        allprixtotal,
                        allverss))
              ],
            ),
          );
        },
      ))),
      debugShowCheckedModeBanner: false,
    );
  }
}
