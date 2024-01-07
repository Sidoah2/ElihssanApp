import 'package:elihssanuser/Components/Widgets/AddClient%20_2.dart';
import 'package:elihssanuser/Pages/Home.dart';
import 'package:elihssanuser/Providers/Clients.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';

class ClientsNav extends StatefulWidget {
  var ctx;
  ClientsNav(this.ctx);
  @override
  State<ClientsNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<ClientsNav> {
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
  Widget build(BuildContext context) {
    List<int> PrixTotals = [];
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
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddClient_2(
                      cntx: widget.ctx,
                    ),
                  ),
                  (route) => false);
            }, Icons.add),
            Consumer<ClientsProv>(
              builder: (context, clientsProv, child) {
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
                                  itemCount: clientsProv.AllAboutClient.length,
                                  itemBuilder: (ctx1, index) {
                                    for (var client
                                        in clientsProv.AllAboutClient) {
                                      int prixtotal = 0;
                                      for (var i = 0;
                                          i < client.bons.length;
                                          i++) {
                                        prixtotal = prixtotal +
                                            int.parse(
                                                client.bons[i].Prixtotalbon);
                                      }
                                      PrixTotals.add(prixtotal);
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
                                                  "${clientsProv.AllAboutClient[index].client.name}"),
                                            ),
                                          ],
                                        )),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${clientsProv.AllAboutClient[index].client.region}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${clientsProv.AllAboutClient[index].client.adress}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${clientsProv.AllAboutClient[index].client.contact}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${PrixTotals[index]}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${clientsProv.AllAboutClient[index].client.verss}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${PrixTotals[index] - int.parse(clientsProv.AllAboutClient[index].client.verss)}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${clientsProv.AllAboutClient[index].client.remarques}")),
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
