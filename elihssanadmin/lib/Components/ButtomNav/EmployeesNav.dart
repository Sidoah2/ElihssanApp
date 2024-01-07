import 'package:elihssanadmin/Objects/Fournisseur.dart';
import 'package:elihssanadmin/Providers/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';

class EmployeesNav extends StatefulWidget {
  var ctx;
  EmployeesNav(this.ctx);
  @override
  State<EmployeesNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<EmployeesNav> {
  List<String> Titres = [
    "Name",
    "lieu de travail",
    "Date de recrutement",
    "Salaire journalier",
    "Montant Totales Des Depenses",
    "Jours de Conge",
    "Jours de travail",
  ];
  late FournisseurObj Fournisseurname;
  var namecntrl = TextEditingController();
  var lieucntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.pink,
              Colors.white,
            ], transform: GradientRotation(-1)),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BotommNaave(() {
              Navigator.pop(widget.ctx);
            }, Icons.home),
            // Consumer<UserProv>(
            //   builder: (context, userProv, child) {
            //     return BotommNaave(() async {
            //       final doc = pw.Document();
            //       doc.addPage(pw.Page(
            //         orientation: pw.PageOrientation.landscape,
            //         build: (ctx) {
            //           // return pdf page qui on va le enregistrer
            //           return pw.Container(
            //             child: pw.Column(
            //                 crossAxisAlignment: pw.CrossAxisAlignment.start,
            //                 children: [
            //                   pw.Divider(
            //                     thickness: 0.5,
            //                   ),
            //                   pw.Row(
            //                     children: Titres.map((e) => pw.Expanded(
            //                         child: pw.Container(
            //                             alignment: pw.Alignment.center,
            //                             child: pw.Text(
            //                               textAlign: pw.TextAlign.center,
            //                               e,
            //                               style: const pw.TextStyle(
            //                                 fontSize: 15,
            //                               ),
            //                             )))).toList(),
            //                   ),
            //                   pw.Divider(
            //                     thickness: 0.5,
            //                   ),
            //                   pw.Container(
            //                     height:
            //                         MediaQuery.of(context).size.height * 0.4491,
            //                     child: pw.ListView.builder(
            //                       itemCount: userProv.Allproduits.length,
            //                       itemBuilder: (ctx1, index) {
            //                         DateTime dateTime;
            //                         if (produitprov
            //                                 .Allproduits[index].dateExp !=
            //                             "") {
            //                           dateTime = DateTime(
            //                               int.parse(produitprov
            //                                   .Allproduits[index].dateExp
            //                                   .substring(6, 10)),
            //                               int.parse(produitprov
            //                                   .Allproduits[index].dateExp
            //                                   .substring(3, 5)),
            //                               int.parse(produitprov
            //                                   .Allproduits[index].dateExp
            //                                   .substring(0, 2)));
            //                         } else {
            //                           dateTime = DateTime(0);
            //                         }

            //                         return pw.Padding(
            //                           padding: const pw.EdgeInsets.all(0.0),
            //                           child: pw.Row(children: [
            //                             pw.Expanded(
            //                                 child: pw.Row(
            //                               mainAxisAlignment:
            //                                   pw.MainAxisAlignment.spaceBetween,
            //                               children: [
            //                                 pw.Expanded(
            //                                   child: pw.Text(
            //                                       textAlign:
            //                                           pw.TextAlign.center,
            //                                       "${produitprov.Allproduits[index].category}"),
            //                                 ),
            //                               ],
            //                             )),
            //                             pw.Expanded(
            //                                 child: pw.Text(
            //                                     textAlign: pw.TextAlign.center,
            //                                     "${produitprov.Allproduits[index].name}")),
            //                             pw.Expanded(
            //                               child: pw.Text(
            //                                   textAlign: pw.TextAlign.center,
            //                                   "${produitprov.Allproduits[index].dateAchat.substring(0, 10)}"),
            //                             ),
            //                             pw.Expanded(
            //                                 child: pw.Text(
            //                                     textAlign: pw.TextAlign.center,
            //                                     "${produitprov.Allproduits[index].PrixAchat}")),
            //                             pw.Expanded(
            //                                 child: pw.Text(
            //                                     textAlign: pw.TextAlign.center,
            //                                     "${produitprov.Allproduits[index].cntt}")),
            //                             pw.Expanded(
            //                                 child: pw.Text(
            //                                     textAlign: pw.TextAlign.center,
            //                                     "${produitprov.Allproduits[index].ZoneStockage}")),
            //                             pw.Expanded(
            //                                 child: dateTime.year != 0
            //                                     ? pw.Text(
            //                                         textAlign:
            //                                             pw.TextAlign.center,
            //                                         "${dateTime.year}/${dateTime.month}/${dateTime.day}",
            //                                       )
            //                                     : pw.Text(
            //                                         textAlign:
            //                                             pw.TextAlign.center,
            //                                         "/",
            //                                       )),
            //                             pw.Expanded(
            //                                 child: pw.Text(
            //                               textAlign: pw.TextAlign.center,
            //                               "${produitprov.Allproduits[index].prixunigros}",
            //                             )),
            //                             pw.Expanded(
            //                                 child: pw.Text(
            //                                     textAlign: pw.TextAlign.center,
            //                                     "${produitprov.Allproduits[index].Fournisseur}")),
            //                           ]),
            //                         );
            //                         ;
            //                       },
            //                     ),
            //                   ),
            //                   pw.Divider(
            //                     thickness: 0.5,
            //                   ),
            //                 ]),
            //           );
            //         },
            //       ));
            //       await Printing.layoutPdf(
            //         onLayout: (format) async => doc.save(),
            //       );
            //     }, Icons.save_alt_rounded);
            //   },
            // ),
            BotommNaave(() {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: 200,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: namecntrl,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("name")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: lieucntrl,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Lieu de travail")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              Provider.of<UserProv>(context, listen: false)
                                  .addempl(
                                      namecntrl.text, lieucntrl.text, context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.pink,
                                  Colors.white,
                                ], transform: GradientRotation(-1)),
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Add"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }, Icons.add)
          ],
        ),
      ),
    );
  }
}
