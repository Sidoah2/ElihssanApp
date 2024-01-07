import 'package:elihssanadmin/Components/ButtomNav/ButtomIconsFournisseur_2.dart';
import 'package:elihssanadmin/Providers/Fournisseur.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FournisseurChoose extends StatelessWidget {
  FournisseurChoose({super.key});
  List<String> Titres = [
    "Fournisseur",
    "Region",
    "Adresse",
    "Contact",
    "Remarques",
    "Dattes"
  ];

  @override
  Widget build(BuildContext contextg) {
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
                        itemCount: fournisseursProv.AllFournisseur.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pop(contextg,
                                  fournisseursProv.AllFournisseur[index]);
                            },
                            child: Container(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.002),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${fournisseursProv.AllFournisseur[index].name}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${fournisseursProv.AllFournisseur[index].region}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${fournisseursProv.AllFournisseur[index].adressfournisseur}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${fournisseursProv.AllFournisseur[index].contact}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${fournisseursProv.AllFournisseur[index].remarques}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${fournisseursProv.AllFournisseur[index].dattes}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            )))
                                  ],
                                )),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: ButtomIconnFournisseur_2(contextg),
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