import 'package:elihssanadmin/Providers/Inventaire.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';

class InventaireNav extends StatefulWidget {
  var ctx;
  InventaireNav(this.ctx);
  @override
  State<InventaireNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<InventaireNav> {
  List<String> Titres = [
    "Category",
    "Produit",
    "Quntity en stock (admin)",
    "Quntity en stock (Users)",
    "Prix d'achat",
    "Zone de stockage",
    "Fournisseur"
  ];
  List<TextEditingController> cntts = [];
  List<bool> Isupdated = [];
  List<int> cnttsOfAllUsers = [];
  int montanttotal = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // for (var i = 0;
    //     i <
    //         Provider.of<InventaireProv>(context, listen: false)
    //             .allaboutcnttProduitObj
    //             .length;
    //     i++) {
    //   cnttsOfAllUsers.add(Provider.of<InventaireProv>(context, listen: false)
    //       .allaboutcnttProduitObj[i]
    //       .ProduitInallUsers);
    //   cntts.add(TextEditingController());
    //   Isupdated.add(false);
    //   montanttotal = montanttotal +
    //       Provider.of<InventaireProv>(context, listen: false)
    //               .Allproduits[i]
    //               .cntt *
    //           int.parse(Provider.of<InventaireProv>(context, listen: false)
    //               .Allproduits[i]
    //               .PrixAchat);
    // }
  }

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
            Consumer<InventaireProv>(
              builder: (context, produitprov, child) {
                return BotommNaave(() async {
                  final doc = pw.Document();
                  doc.addPage(pw.Page(
                    orientation: pw.PageOrientation.landscape,
                    build: (ctx) {
                      // return pdf page qui on va le enregistrer
                      return pw.Container(
                        child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Divider(
                                thickness: 0.5,
                              ),
                              pw.Row(
                                children: Titres.map((e) => pw.Expanded(
                                    child: pw.Container(
                                        alignment: pw.Alignment.center,
                                        child: pw.Text(
                                          textAlign: pw.TextAlign.center,
                                          e,
                                          style: const pw.TextStyle(
                                            fontSize: 15,
                                          ),
                                        )))).toList(),
                              ),
                              pw.Divider(
                                thickness: 0.5,
                              ),
                              pw.Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4491,
                                child: pw.ListView.builder(
                                  itemCount: produitprov.Allproduits.length,
                                  itemBuilder: (ctx1, index) {
                                    cntts[index].text = produitprov
                                        .Allproduits[index].cntt
                                        .toString();
                                    return pw.Padding(
                                      padding: const pw.EdgeInsets.all(0.0),
                                      child: pw.Row(children: [
                                        pw.Expanded(
                                            child: pw.Row(
                                          mainAxisAlignment:
                                              pw.MainAxisAlignment.spaceBetween,
                                          children: [
                                            pw.Expanded(
                                              child: pw.Text(
                                                  textAlign:
                                                      pw.TextAlign.center,
                                                  "${produitprov.Allproduits[index].category}"),
                                            ),
                                          ],
                                        )),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${produitprov.Allproduits[index].name}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${cntts[index].text}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${cnttsOfAllUsers[index]}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${produitprov.Allproduits[index].PrixAchat}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${produitprov.Allproduits[index].ZoneStockage}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${produitprov.Allproduits[index].Fournisseur}")),
                                      ]),
                                    );
                                    ;
                                  },
                                ),
                              ),
                              pw.Divider(
                                thickness: 0.5,
                              ),
                              pw.Container(
                                padding: pw.EdgeInsets.only(right: 20),
                                child: pw.Column(
                                  children: [
                                    pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.end,
                                      children: [
                                        pw.Padding(
                                          padding: const pw.EdgeInsets.all(8.0),
                                          child: pw.Text(
                                            "Montant Total des Produits :",
                                          ),
                                        ),
                                        pw.Padding(
                                          padding: const pw.EdgeInsets.all(8.0),
                                          child: pw.Text(
                                            "$montanttotal",
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      );
                    },
                  ));
                  await Printing.layoutPdf(
                    onLayout: (format) async => doc.save(),
                  );
                }, Icons.save_alt_rounded);
              },
            ),
          ],
        ),
      ),
    );
  }
}
