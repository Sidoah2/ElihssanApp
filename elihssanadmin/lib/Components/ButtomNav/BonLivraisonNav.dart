// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:elihssanadmin/Helpers/initialisations.dart';
import 'package:elihssanadmin/Pages/Home.dart';
import 'package:elihssanadmin/Providers/BonLivraison.dart';
import 'package:elihssanadmin/Providers/Bons.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';

class BonLivraisonNav extends StatefulWidget {
  var ctx, PrixTotalOfBon;

  BonLivraisonNav(this.ctx, this.PrixTotalOfBon);
  @override
  State<BonLivraisonNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<BonLivraisonNav> {
  List<String> titres = [
    "Designation",
    "Quntity",
    "Prix Uni (dz)",
    "Total (dz)"
  ];

  String Fournisseurname = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
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
              Initialisation.IniBon(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                  (route) => false);
            }, Icons.home),
            Consumer<BonLivraisonProv>(
              builder: (context, bonLivraisonProv, child) {
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
                                children: titres
                                    .map((e) => pw.Expanded(
                                        child: pw.Container(
                                            alignment: pw.Alignment.center,
                                            child: pw.Text(
                                              textAlign: pw.TextAlign.center,
                                              e,
                                              style: const pw.TextStyle(
                                                fontSize: 15,
                                              ),
                                            ))))
                                    .toList(),
                              ),
                              pw.Divider(
                                thickness: 0.5,
                              ),
                              pw.Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4491,
                                child: pw.ListView.builder(
                                  itemCount: bonLivraisonProv
                                      .AllProduitsSlected.length,
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
                                                  "${bonLivraisonProv.AllProduitsSlected[index].Designation}"),
                                            ),
                                          ],
                                        )),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${bonLivraisonProv.AllProduitsSlected[index].Quntity}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${bonLivraisonProv.AllProduitsSlected[index].Prixuni}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${int.parse(bonLivraisonProv.AllProduitsSlected[index].Prixuni) * int.parse(bonLivraisonProv.AllProduitsSlected[index].Quntity)}")),
                                      ]),
                                    );
                                    ;
                                  },
                                ),
                              ),
                              pw.Divider(
                                thickness: 0.5,
                              ),
                              pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(2),
                                    child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.end,
                                      children: [
                                        pw.Expanded(
                                          child: pw.Container(),
                                          flex: 1,
                                        ),
                                        pw.Expanded(
                                            child:
                                                pw.Text("Montant Total (dz)")),
                                        pw.Expanded(
                                          flex: 1,
                                          child: pw.Container(
                                            child: pw.Container(
                                              padding: pw.EdgeInsets.all(10),
                                              // decoration: pw.BoxDecoration(
                                              //     border: pw.Border.all()),
                                              child: pw.Text(
                                                  "${widget.PrixTotalOfBon}",
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(2),
                                    child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.end,
                                      children: [
                                        pw.Expanded(
                                          child: pw.Container(),
                                          flex: 1,
                                        ),
                                        pw.Expanded(
                                            child: pw.Text(
                                                "Montant Total De Verssement (dz)")),
                                        pw.Expanded(
                                          flex: 1,
                                          child: pw.Container(
                                            child: pw.Container(
                                              padding: pw.EdgeInsets.all(10),
                                              child: pw.Text(
                                                  "${Provider.of<BonLivraisonProv>(context, listen: false).bon.verssement}",
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(2),
                                    child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.end,
                                      children: [
                                        pw.Expanded(
                                          child: pw.Container(),
                                          flex: 1,
                                        ),
                                        pw.Expanded(
                                            child: pw.Text(
                                                "Montant Total Restant (dz)")),
                                        pw.Expanded(
                                          flex: 1,
                                          child: pw.Container(
                                            child: pw.Container(
                                              padding: pw.EdgeInsets.all(10),
                                              child: pw.Text(
                                                  "${widget.PrixTotalOfBon - int.parse(Provider.of<BonLivraisonProv>(context, listen: false).bon.verssement)}",
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
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
            BotommNaave(() {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                    title: Text("Ajout Bon"),
                    content: Wrap(
                      alignment: WrapAlignment.end,
                      children: [
                        // build_text_input("Verssement", montant),
                        ElevatedButton(
                            onPressed: () async {
                              String des = "";
                              String prixunis = "";
                              String cntts = "";
                              String oldcntts = "";
                              String ids = "";

                              print(Provider.of<BonLivraisonProv>(context,
                                      listen: false)
                                  .bon
                                  .verssement);
                              for (var i = 0;
                                  i <
                                      Provider.of<BonLivraisonProv>(context,
                                              listen: false)
                                          .AllProduitsSlected
                                          .length;
                                  i++) {
                                des = des +
                                    Provider.of<BonLivraisonProv>(context,
                                            listen: false)
                                        .AllProduitsSlected[i]
                                        .Designation +
                                    ",";
                                cntts = cntts +
                                    Provider.of<BonLivraisonProv>(context,
                                            listen: false)
                                        .AllProduitsSlected[i]
                                        .Quntity +
                                    ",";
                                oldcntts = oldcntts +
                                    Provider.of<BonLivraisonProv>(context,
                                            listen: false)
                                        .AllProduitsSlected[i]
                                        .Oldcntt +
                                    ",";
                                ids = ids +
                                    Provider.of<BonLivraisonProv>(context,
                                            listen: false)
                                        .AllProduitsSlected[i]
                                        .ids +
                                    ",";
                                prixunis = prixunis +
                                    Provider.of<BonLivraisonProv>(context,
                                            listen: false)
                                        .AllProduitsSlected[i]
                                        .Prixuni +
                                    ",";
                              }
                              Provider.of<BonLivraisonProv>(context,
                                      listen: false)
                                  .bon
                                  .IdUser = "admin";
                              Provider.of<BonLivraisonProv>(context,
                                      listen: false)
                                  .bon
                                  .Designation = des;
                              Provider.of<BonLivraisonProv>(context,
                                      listen: false)
                                  .bon
                                  .Quntity = cntts;
                              Provider.of<BonLivraisonProv>(context,
                                      listen: false)
                                  .bon
                                  .IdsProduit = ids;
                              Provider.of<BonLivraisonProv>(context,
                                      listen: false)
                                  .bon
                                  .OldQuntity = oldcntts;
                              Provider.of<BonLivraisonProv>(context,
                                      listen: false)
                                  .bon
                                  .Prixuni = prixunis;
                              Provider.of<BonsProv>(context, listen: false)
                                  .AddBon(
                                      Provider.of<BonLivraisonProv>(context,
                                              listen: false)
                                          .bon,
                                      context);
                            },
                            child: Text("Save"),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.amber)))
                      ],
                    )),
              );
            }, Icons.add)
          ],
        ),
      ),
    );
  }

  build_text_input(labeltext, TextEditingController textEditingController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: TextStyle(color: Colors.black),
        controller: textEditingController,
        keyboardType: TextInputType.name,
        cursorColor: Colors.black,
        cursorWidth: 1,
        autocorrect: true,
        decoration: InputDecoration(
            hintStyle: TextStyle(
              color: Color.fromARGB(179, 198, 191, 191),
            ),
            labelText: labeltext,
            labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
            prefixIconColor: Colors.white54),
      ),
    );
  }
}
