import 'package:elihssanadmin/Components/Affichage/BeneficesAfichage.dart';
import 'package:elihssanadmin/Components/ButtomNav/BenefiNavces.dart';
import 'package:elihssanadmin/Providers/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Benefice extends StatefulWidget {
  Benefice({super.key});

  @override
  State<Benefice> createState() => _beneficePageState();
}

class _beneficePageState extends State<Benefice> {
  List<String> Titres = [
    "User Name",
    "Montant Total de vent",
    "Montant Total de credit",
    "Revenues",
    "Depenses sur (E)",
    "Benefices",
  ];

  List<int> AllPrixDeVents = [];
  List<int> AllPrixDeVerss = [];
  List<int> AllPrixDedepenses = [];

  @override
  Widget build(BuildContext context) {
    int prixTotaDevent = 0;
    int prixTotalDeRevenu = 0;
    int prixTotalDeDepense = 0;
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
              body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.002,
            horizontal: MediaQuery.of(context).size.width * 0.02),
        child: Consumer<UserProv>(
          builder: (context, userProv, child) {
            for (var user in userProv.AllaboutUsers) {
              int prix = 0;
              int prixverss = 0;
              int prixdepens = 0;
              for (var bon in user.bons) {
                prix = prix + int.parse(bon.Prixtotalbon);
                prixTotaDevent = prixTotaDevent + int.parse(bon.Prixtotalbon);
              }

              for (var client in user.clients) {
                prixverss = prixverss + int.parse(client.verss);
                prixTotalDeRevenu = prixTotalDeRevenu + int.parse(client.verss);
              }
              for (var depense in user.depenses) {
                if (depense.type == "entreprise") {
                  prixdepens = prixdepens + int.parse(depense.montant);
                  prixTotalDeDepense =
                      prixTotalDeDepense + int.parse(depense.montant);
                }
              }
              AllPrixDeVents.add(prix);
              AllPrixDeVerss.add(prixverss);
              AllPrixDedepenses.add(prixdepens);
            }
            // print("${prixTotaDevent}");
            return Container(
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
                        itemCount: userProv.AllaboutUsers.length,
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
                                          child: Text(
                                            "${userProv.AllaboutUsers[index].name}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${AllPrixDeVents[index]}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${AllPrixDeVents[index] - AllPrixDeVerss[index]}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${AllPrixDeVerss[index]}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${AllPrixDedepenses[index]}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${AllPrixDeVents[index] - AllPrixDedepenses[index]}",
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
                  BeneficesAfichage(
                      prixTotal: prixTotaDevent,
                      verssement: prixTotalDeRevenu,
                      montantTotaldepenses: prixTotalDeDepense),
                  Container(
                    child: BeneficesNav(
                        userProv.AllaboutUsers,
                        AllPrixDeVents,
                        AllPrixDeVerss,
                        AllPrixDedepenses,
                        prixTotaDevent,
                        prixTotalDeRevenu,
                        prixTotalDeDepense),
                  )
                ],
              ),
            );
          },
        ),
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