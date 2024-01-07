import 'package:elihssanadmin/Components/Widgets/AddFournisseur.dart';
import 'package:elihssanadmin/Pages/Home.dart';
import 'package:elihssanadmin/Providers/Fournisseur.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';

class FournisseurNav extends StatefulWidget {
  var ctx;
  FournisseurNav(this.ctx);
  @override
  State<FournisseurNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<FournisseurNav> {
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
  var namecntrl = TextEditingController();
  var categorycntrl = TextEditingController();

  var prixachatcntrl = TextEditingController();

  var cnttcntrl = TextEditingController();

  var cntrl = TextEditingController();

  var zonestockagecntrl = TextEditingController();

  var dateexpcntrl = TextEditingController();
  var prixventcntrl = TextEditingController();
  var fournisseurcntrl = TextEditingController();
  List<int> prixtotals = [];
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
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                  (route) => false);
            }, Icons.home),
            BotommNaave(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddFournisseur(),
                  ));
            }, Icons.add),
            Consumer<FournisseursProv>(
              builder: (context, fournisseursProv, child) {
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
                                  itemCount: fournisseursProv
                                      .AllAboutFournisseur.length,
                                  itemBuilder: (ctx1, index) {
                                    for (var fournisseur in fournisseursProv
                                        .AllAboutFournisseur) {
                                      int prix = 0;
                                      for (var produit
                                          in fournisseur.produits) {
                                        prix = prix +
                                            produit.cntt *
                                                int.parse(produit.PrixAchat);
                                      }
                                      prixtotals.add(prix);
                                    }

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
                                                  "${fournisseursProv.AllAboutFournisseur[index].fournisseur.name}"),
                                            ),
                                          ],
                                        )),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${fournisseursProv.AllAboutFournisseur[index].fournisseur.region}")),
                                        pw.Expanded(
                                          child: pw.Text(
                                              textAlign: pw.TextAlign.center,
                                              "${fournisseursProv.AllAboutFournisseur[index].fournisseur.adressfournisseur}"),
                                        ),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${fournisseursProv.AllAboutFournisseur[index].fournisseur.contact}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${prixtotals[index]}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${fournisseursProv.AllAboutFournisseur[index].fournisseur.verss}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${prixtotals[index] - fournisseursProv.AllAboutFournisseur[index].fournisseur.verss}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${fournisseursProv.AllAboutFournisseur[index].fournisseur.remarques}")),
                                      ]),
                                    );
                                    ;
                                  },
                                ),
                              ),
                              pw.Divider(
                                thickness: 0.5,
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
