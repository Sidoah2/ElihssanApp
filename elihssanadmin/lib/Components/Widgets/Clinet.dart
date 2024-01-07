import 'package:elihssanadmin/Providers/Clients.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectCLient extends StatelessWidget {
  SelectCLient({super.key});
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

  @override
  Widget build(BuildContext contextg) {
    List<int> PrixTotals = [];
    return MaterialApp(
      home: SafeArea(child: Scaffold(
        // floatingActionButtonLocation:
        //     FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: ButtomIconsClinets(context),
        body: Consumer<ClientsProv>(
          builder: (context, clientsProv, child) {
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
                          itemCount: clientsProv.AllAboutClient.length,
                          itemBuilder: (context, index) {
                            for (var client in clientsProv.AllAboutClient) {
                              int prixtotal = 0;
                              for (var i = 0; i < client.bons.length; i++) {
                                prixtotal = prixtotal +
                                    int.parse(client.bons[i].Prixtotalbon);
                              }
                              PrixTotals.add(prixtotal);
                            }
                            return Container(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.002),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: InkWell(
                                      onTap: () {
                                        Navigator.pop(contextg,
                                            clientsProv.AllAboutClient[index]);
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${clientsProv.AllAboutClient[index].client.name}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    )),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${clientsProv.AllAboutClient[index].client.region}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${clientsProv.AllAboutClient[index].client.adress}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${clientsProv.AllAboutClient[index].client.contact}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${PrixTotals[index]}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${clientsProv.AllAboutClient[index].client.verss}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${PrixTotals[index] - int.parse(clientsProv.AllAboutClient[index].client.verss)}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${clientsProv.AllAboutClient[index].client.remarques}",
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
                    // ListView.builder(
                    //   itemCount: allnames.length,
                    //   itemBuilder: (context, index) {
                    //     return Container(
                    //         child: Row(
                    //       children: [
                    //         Expanded(
                    //             child: Container(
                    //                 alignment: Alignment.center,
                    //                 child: Text(
                    //                   "${allbonsdiff[index].region}",
                    //                   style: const TextStyle(
                    //                       fontSize: 15,
                    //                       fontWeight: FontWeight.w500),
                    //                 ))),
                    //         Expanded(
                    //             child: Container(
                    //                 alignment: Alignment.center,
                    //                 child: Text(
                    //                   "${allbonsdiff[index].adress}",
                    //                   style: const TextStyle(
                    //                       fontSize: 15,
                    //                       fontWeight: FontWeight.w500),
                    //                 ))),
                    //         Expanded(
                    //             child: Container(
                    //                 alignment: Alignment.center,
                    //                 child: Text(
                    //                   "${allbonsdiff[index].phone}",
                    //                   style: const TextStyle(
                    //                       fontSize: 15,
                    //                       fontWeight: FontWeight.w500),
                    //                 ))),
                    //         Expanded(
                    //             child: Container(
                    //                 alignment: Alignment.center,
                    //                 child: Text(
                    //                   "${allprix[index]}",
                    //                   style: const TextStyle(
                    //                       fontSize: 15,
                    //                       fontWeight: FontWeight.w500),
                    //                 ))),
                    //         Expanded(
                    //             child: Container(
                    //                 alignment: Alignment.center,
                    //                 child: Text(
                    //                   "${varsemment[index]}",
                    //                   style: const TextStyle(
                    //                       fontSize: 15,
                    //                       fontWeight: FontWeight.w500),
                    //                 ))),
                    //         Expanded(
                    //             child: Container(
                    //                 alignment: Alignment.center,
                    //                 child: Text(
                    //                   "${allprix[index] - varsemment[index]}",
                    //                   style: const TextStyle(
                    //                       fontSize: 15,
                    //                       fontWeight: FontWeight.w500),
                    //                 ))),
                    //         Expanded(
                    //             child: Container(
                    //                 alignment: Alignment.center,
                    //                 child: Text(
                    //                   "${allbonsdiff[index].remarques}",
                    //                   style: const TextStyle(
                    //                       fontSize: 15,
                    //                       fontWeight: FontWeight.w500),
                    //                 ))),
                    //         Expanded(
                    //             child: Container(
                    //                 alignment: Alignment.center,
                    //                 child: Text(
                    //                   "${allbonsdiff[index].dattes}",
                    //                   style: const TextStyle(
                    //                       fontSize: 15,
                    //                       fontWeight: FontWeight.w500),
                    //                 )))
                    //       ],
                    //     ));
                    //   },
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      )),
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