import 'package:elihssanuser/Objects/Bons.dart';
import 'package:elihssanuser/Objects/Clients.dart';
import 'package:elihssanuser/Pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'BottomNav.dart';

class ALlBonOfClientNav extends StatefulWidget {
  var ctx;
  List<BonsObj> allbon;
  ClientObj client;
  int prixtotal, versement;
  ALlBonOfClientNav(
      this.client, this.ctx, this.allbon, this.prixtotal, this.versement);
  @override
  State<ALlBonOfClientNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<ALlBonOfClientNav> {
  List<String> Titres = ["N° Bon de Livraison", "Date", "Montant"];

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
            BotommNaave(() async {
              final doc = pw.Document();
              doc.addPage(pw.Page(
                orientation: pw.PageOrientation.landscape,
                build: (ctx) {
                  // return pdf page qui on va le enregistrer
                  return pw.Container(
                    child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Container(child: pw.Text('${widget.client.name}')),
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
                            height: MediaQuery.of(context).size.height * 0.40,
                            child: pw.ListView.builder(
                              itemCount: widget.allbon.length,
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
                                              textAlign: pw.TextAlign.center,
                                              "${widget.allbon[index].NBDV}"),
                                        ),
                                      ],
                                    )),
                                    pw.Expanded(
                                        child: pw.Text(
                                            textAlign: pw.TextAlign.center,
                                            "${widget.allbon[index].date.substring(0, 10)}")),
                                    pw.Expanded(
                                      child: pw.Text(
                                          textAlign: pw.TextAlign.center,
                                          "${widget.allbon[index].Prixtotalbon}"),
                                    ),
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
                                  mainAxisAlignment: pw.MainAxisAlignment.end,
                                  children: [
                                    pw.Expanded(
                                      child: pw.Container(),
                                      flex: 1,
                                    ),
                                    pw.Expanded(
                                        child: pw.Text("Montant Total (dz)")),
                                    pw.Expanded(
                                      flex: 1,
                                      child: pw.Container(
                                        child: pw.Container(
                                          padding: pw.EdgeInsets.all(10),
                                          // decoration: pw.BoxDecoration(
                                          //     border: pw.Border.all()),
                                          child: pw.Text("${widget.prixtotal}",
                                              textAlign: pw.TextAlign.center),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.all(2.0),
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.end,
                                  children: [
                                    pw.Expanded(
                                      child: pw.Container(),
                                      flex: 1,
                                    ),
                                    pw.Expanded(
                                        child: pw.Text("Versement (dz)")),
                                    pw.Expanded(
                                      flex: 1,
                                      child: pw.Container(
                                        child: pw.Container(
                                          child: pw.Container(
                                            padding: pw.EdgeInsets.all(10),
                                            // decoration: pw.BoxDecoration(
                                            //     border: pw.Border.all()),
                                            child: pw.Text(
                                                "${widget.versement}",
                                                textAlign: pw.TextAlign.center),
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
                                  mainAxisAlignment: pw.MainAxisAlignment.end,
                                  children: [
                                    pw.Expanded(
                                      child: pw.Container(),
                                      flex: 1,
                                    ),
                                    pw.Expanded(child: pw.Text("Restant (dz)")),
                                    pw.Expanded(
                                      flex: 1,
                                      child: pw.Container(
                                        child: pw.Container(
                                          child: pw.Container(
                                            padding: pw.EdgeInsets.all(10),
                                            // decoration: pw.BoxDecoration(
                                            //     border: pw.Border.all()),
                                            child: pw.Text(
                                                "${widget.prixtotal - widget.versement}",
                                                textAlign: pw.TextAlign.center),
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
            }, Icons.save_alt_rounded)
          ],
        ),
      ),
    );
  }
}
