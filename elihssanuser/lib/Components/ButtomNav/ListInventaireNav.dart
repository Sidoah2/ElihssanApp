import 'package:elihssanuser/Objects/Inventaire.dart';
import 'package:elihssanuser/Providers/Inventaire.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';

class ListInventaireNav extends StatefulWidget {
  var ctx;
  ListInventaireNav(this.ctx);
  @override
  State<ListInventaireNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<ListInventaireNav> {
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
              builder: (context, inventaireProv, child) {
                List<InventaireObj> produits = [];
                for (var produit in inventaireProv.Allproduits) {
                  if (produit.isupdated) {
                    produits.add(produit);
                  }
                }
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
                                  itemCount: produits.length,
                                  itemBuilder: (ctx1, index) {
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
                                                  "${produits[index].category}"),
                                            ),
                                          ],
                                        )),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${produits[index].name}")),
                                        pw.Expanded(
                                          child: pw.Text(
                                              textAlign: pw.TextAlign.center,
                                              "${produits[index].cntt}"),
                                        ),
                                      ]),
                                    );
                                  },
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: pw.Container(
                                  child: pw.Row(
                                    mainAxisAlignment: pw.MainAxisAlignment.end,
                                    children: [
                                      pw.Text("Total Produits :"),
                                      pw.Text("${total}")
                                    ],
                                  ),
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
            )
          ],
        ),
      ),
    );
  }
}
