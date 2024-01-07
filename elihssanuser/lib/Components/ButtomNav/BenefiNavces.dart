import 'package:elihssanuser/Objects/User.dart';
import 'package:elihssanuser/Pages/Home.dart';
import 'package:elihssanuser/Providers/Bons.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';

class BeneficesNav extends StatefulWidget {
  List<UserObj> AllaboutUsers;
  List<int> AllPrixDeVents;
  List<int> AllPrixDeVerss;
  List<int> AllPrixDedepenses;
  int prixTotaDevent;
  int prixTotalDeReven;
  int prixTotalDeDepense;
  BeneficesNav(
      this.AllaboutUsers,
      this.AllPrixDeVents,
      this.AllPrixDeVerss,
      this.AllPrixDedepenses,
      this.prixTotaDevent,
      this.prixTotalDeReven,
      this.prixTotalDeDepense);
  @override
  State<BeneficesNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<BeneficesNav> {
  List<String> Titres = [
    "User Name",
    "Montant Total de vent",
    "Montant Total de credit",
    "Revenues",
    "Depenses sur (E)",
    "Benefices",
  ];
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
            Consumer<BonsProv>(
              builder: (context, bonsprov, child) {
                return BotommNaave(() async {
                  final doc = pw.Document();
                  doc.addPage(pw.Page(
                    orientation: pw.PageOrientation.landscape,
                    build: (ctx) {
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
                                    MediaQuery.of(context).size.height * 0.35,
                                child: pw.ListView.builder(
                                  itemCount: widget.AllaboutUsers.length,
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
                                                  "${widget.AllaboutUsers[index].name}"),
                                            ),
                                          ],
                                        )),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${widget.AllPrixDeVents[index]}")),
                                        pw.Expanded(
                                          child: pw.Text(
                                              textAlign: pw.TextAlign.center,
                                              "${widget.AllPrixDeVents[index] - widget.AllPrixDeVerss[index]}"),
                                        ),
                                        pw.Expanded(
                                          child: pw.Text(
                                              textAlign: pw.TextAlign.center,
                                              "${widget.AllPrixDeVerss[index]}"),
                                        ),
                                        pw.Expanded(
                                          child: pw.Text(
                                              textAlign: pw.TextAlign.center,
                                              "${widget.AllPrixDedepenses[index]}"),
                                        ),
                                        pw.Expanded(
                                          child: pw.Text(
                                              textAlign: pw.TextAlign.center,
                                              "${widget.AllPrixDeVents[index] - widget.AllPrixDedepenses[index]}"),
                                        ),
                                      ]),
                                    );
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
                                        ),
                                        pw.Expanded(
                                            child: pw.Text(
                                                "Montant Total des ventes (dz)")),
                                        pw.Expanded(
                                          child: pw.Container(
                                            child: pw.Container(
                                              padding: pw.EdgeInsets.all(10),
                                              child: pw.Text(
                                                  "${widget.prixTotaDevent}",
                                                  textAlign:
                                                      pw.TextAlign.center),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(2.0),
                                    child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.end,
                                      children: [
                                        pw.Expanded(
                                          child: pw.Container(),
                                        ),
                                        pw.Expanded(
                                            child: pw.Text(
                                                "Montant Total des Credit (dz)")),
                                        pw.Expanded(
                                          child: pw.Container(
                                            child: pw.Container(
                                              child: pw.Container(
                                                padding: pw.EdgeInsets.all(10),
                                                child: pw.Text(
                                                    "${widget.prixTotaDevent - widget.prixTotalDeReven}",
                                                    textAlign:
                                                        pw.TextAlign.center),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(2.0),
                                    child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.end,
                                      children: [
                                        pw.Expanded(
                                          child: pw.Container(),
                                        ),
                                        pw.Expanded(
                                            child: pw.Text(
                                                "Montant Total des Revenues (dz)")),
                                        pw.Expanded(
                                          child: pw.Container(
                                            child: pw.Container(
                                              child: pw.Container(
                                                padding: pw.EdgeInsets.all(10),
                                                // decoration: pw.BoxDecoration(
                                                //     border: pw.Border.all()),
                                                child: pw.Text(
                                                    "${widget.prixTotalDeReven}",
                                                    textAlign:
                                                        pw.TextAlign.center),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
          ],
        ),
      ),
    );
  }
}
