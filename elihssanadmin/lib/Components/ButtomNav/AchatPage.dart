import 'package:elihssanadmin/Components/Widgets/FournisseurChoose.dart';
import 'package:elihssanadmin/Objects/Allaboutfournisseur.dart';
import 'package:elihssanadmin/Objects/Fournisseur.dart';
import 'package:elihssanadmin/Pages/Home.dart';
import 'package:elihssanadmin/Providers/Fournisseur.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';

class AchatPageNav extends StatefulWidget {
  var ctx;
  List<AllAboutFournisseurObj> fournisseur;
  List<int> montantTota;
  int length, montanttotal, montanttotalverss;
  AchatPageNav(this.ctx, this.fournisseur, this.montantTota, this.length,
      this.montanttotal, this.montanttotalverss);
  @override
  State<AchatPageNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<AchatPageNav> {
  List<String> Titres = [
    "Fournisseur",
    "Adress",
    "Montant Total",
    "Montant Payé",
    "Montant restant"
  ];
  String Fournisseurname = "";
  var category = TextEditingController();
  var montant = TextEditingController();
  var user = TextEditingController();
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
                            height: MediaQuery.of(context).size.height * 0.4491,
                            child: pw.ListView.builder(
                              itemCount: widget.length,
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
                                              "${widget.fournisseur[index].fournisseur.name}"),
                                        ),
                                      ],
                                    )),
                                    pw.Expanded(
                                        child: pw.Text(
                                            textAlign: pw.TextAlign.center,
                                            "${widget.fournisseur[index].fournisseur.adressfournisseur}")),
                                    pw.Expanded(
                                        child: pw.Text(
                                            textAlign: pw.TextAlign.center,
                                            "${widget.fournisseur[index].fournisseur.verss}")),
                                    pw.Expanded(
                                        child: pw.Text(
                                            textAlign: pw.TextAlign.center,
                                            "${widget.fournisseur[index].fournisseur.verss}")),
                                    pw.Expanded(
                                        child: pw.Text(
                                            textAlign: pw.TextAlign.center,
                                            "${widget.montantTota[index] - widget.fournisseur[index].fournisseur.verss}")),
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
                                          child: pw.Text(
                                              "${widget.montanttotal}",
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
                                                "${widget.montanttotalverss}",
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
                                                "${widget.montanttotal - widget.montanttotalverss}",
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
            }, Icons.save_alt_rounded),
            BotommNaave(() {
              late FournisseurObj f;
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                    title: Text("Ajout verssement"),
                    content: Wrap(
                      alignment: WrapAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              f = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FournisseurChoose(),
                                  ));
                              Fournisseurname = f.name;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("Choose a fournisseur"),
                              ),
                            ),
                          ),
                        ),
                        build_text_input("Verssement", montant),
                        ElevatedButton(
                            onPressed: () async {
                              Provider.of<FournisseursProv>(context,
                                      listen: false)
                                  .updateverss(
                                      f.id,
                                      int.parse(montant.text) + f.verss,
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
