import 'package:elihssanadmin/Components/Widgets/Conges.dart';
import 'package:elihssanadmin/Objects/Depense.dart';
import 'package:elihssanadmin/Objects/User.dart';
import 'package:elihssanadmin/Pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'BottomNav.dart';

class BulletinNav extends StatefulWidget {
  var ctx;
  UserObj user;
  int Totaldesdepenses;
  BulletinNav(this.ctx, this.user, this.Totaldesdepenses);
  @override
  State<BulletinNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<BulletinNav> {
  List<String> Titres = ["Category de depense", "Montant (dz)", "Date "];

  String Fournisseurname = "";
  var category = TextEditingController();
  var montant = TextEditingController();
  var user = TextEditingController();
  int cngs = 0;
  int JoursTravail = 0;
  List<DepenseObj> depenses = [];

  @override
  Widget build(BuildContext context) {
    for (var depense in widget.user.depenses) {
      if (depense.type != "entreprise") {
        depenses.add(depense);
      }
    }
    for (var congge in widget.user.congees) {
      if (congge.arrivee != "dd/mm/yyyy") {
        DateTime depart = DateTime.parse(
            "${congge.depart.substring(6, 10)}-${congge.depart.substring(3, 5)}-${congge.depart.substring(0, 2)}");
        DateTime arrivee = DateTime.parse(
            "${congge.arrivee.substring(6, 10)}-${congge.arrivee.substring(3, 5)}-${congge.arrivee.substring(0, 2)}");
        Duration diff = arrivee.difference(depart);
        cngs = cngs + diff.inDays;
      }
      if (widget.user.daterec != "dd/mm/yyyy") {
        DateTime recrutement = DateTime.parse(
            "${widget.user.daterec.substring(6, 10)}-${widget.user.daterec.substring(3, 5)}-${widget.user.daterec.substring(0, 2)}");
        DateTime now = DateTime.now();
        Duration difftravail = now.difference(recrutement);
        JoursTravail = JoursTravail + difftravail.inDays;
      }
    }

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
                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                            children: [
                              pw.Row(
                                children: [
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(15.0),
                                    child: pw.Text("Name :"),
                                  ),
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(15.0),
                                    child: pw.Text("${widget.user.name}"),
                                  )
                                ],
                              ),
                              pw.Row(
                                children: [
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(15.0),
                                    child: pw.Text("Congees :"),
                                  ),
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(15.0),
                                    child: pw.Text("$cngs"),
                                  )
                                ],
                              ),
                            ],
                          ),
                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                            children: [
                              pw.Row(
                                children: [
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(15.0),
                                    child: pw.Text("Lieu De Travail :"),
                                  ),
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(15.0),
                                    child: pw.Text("${widget.user.lieu}"),
                                  )
                                ],
                              ),
                              pw.Row(
                                children: [
                                  pw.Row(
                                    children: [
                                      pw.Padding(
                                        padding: const pw.EdgeInsets.all(15.0),
                                        child: pw.Text("Jours de Travail :"),
                                      ),
                                      pw.Padding(
                                        padding: const pw.EdgeInsets.all(15.0),
                                        child:
                                            pw.Text("${JoursTravail - cngs}"),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                            children: [
                              pw.Row(
                                children: [
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(15.0),
                                    child: pw.Text("Date de recrutement :"),
                                  ),
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(15.0),
                                    child: pw.Text("${widget.user.daterec}"),
                                  )
                                ],
                              ),
                              pw.Row(
                                children: [
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(15.0),
                                    child: pw.Text(""),
                                  ),
                                  pw.Padding(
                                    padding: const pw.EdgeInsets.all(15.0),
                                    child: pw.Text(""),
                                  )
                                ],
                              ),
                            ],
                          ),
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
                          pw.Expanded(
                            child: pw.Container(
                              child: pw.ListView.builder(
                                itemCount: depenses.length,
                                itemBuilder: (ctx1, index) {
                                  return pw.Padding(
                                    padding: const pw.EdgeInsets.all(0.0),
                                    child: pw.Row(children: [
                                      pw.Expanded(
                                          child: pw.Text(
                                              textAlign: pw.TextAlign.center,
                                              "${depenses[index].type}")),
                                      pw.Expanded(
                                          child: pw.Text(
                                              textAlign: pw.TextAlign.center,
                                              "${depenses[index].montant}")),
                                      pw.Expanded(
                                          child: pw.Text(
                                              textAlign: pw.TextAlign.center,
                                              "${depenses[index].date.substring(0, 10)}")),
                                    ]),
                                  );
                                  ;
                                },
                              ),
                            ),
                          ),
                          pw.Divider(
                            thickness: 0.5,
                          ),
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.end,
                            children: [
                              pw.Padding(
                                padding: const pw.EdgeInsets.all(2),
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.end,
                                  children: [
                                    pw.Expanded(
                                        child: pw.Text(
                                            "Total des droits financiers des salaries :")),
                                    pw.Expanded(
                                      child: pw.Container(
                                        child: pw.Container(
                                          padding: pw.EdgeInsets.all(10),
                                          child: pw.Text(
                                              "${(int.parse(widget.user.salairej) * (JoursTravail - cngs)) - widget.Totaldesdepenses}",
                                              textAlign: pw.TextAlign.center),
                                        ),
                                      ),
                                    )
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
            }, Icons.save_alt_rounded),
            BotommNaave(() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Conges(widget.user)));
            }, Icons.date_range_outlined)
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
