import 'package:elihssanuser/Components/ButtomNav/BottomNav.dart';
import 'package:elihssanuser/Objects/Bons.dart';
import 'package:elihssanuser/Pages/Home.dart';
import 'package:elihssanuser/Services/Bons.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ContenuOfBonNav extends StatefulWidget {
  var ctx;
  String Client;
  String NBDV;
  BonsObj bon;
  int prixtotal, versement;
  List cnttcntrl;
  ContenuOfBonNav(this.ctx, this.Client, this.NBDV, this.bon, this.prixtotal,
      this.versement, this.cnttcntrl);
  @override
  State<ContenuOfBonNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<ContenuOfBonNav> {
  List<String> titres = [
    "Designation",
    "Quntity",
    "Prix Uni (dz)",
    "Total (dz)"
  ];
  List des = [];
  List Prixuni = [];

  List Quntity = [];
  var prixtotalbon = 0;

  @override
  Widget build(BuildContext context) {
    des = widget.bon.Deignation;
    Quntity = widget.bon.Quntity;

    Prixuni = widget.bon.PrixUni;

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
              print(widget.cnttcntrl[0].text);
              print(widget.bon.Deignation[0]);
              print(widget.bon.id);
              print(widget.bon.PrixUni[0]);
              for (var i = 0; i < widget.bon.Deignation.length - 1; i++) {
                widget.bon.Quntity[i] = widget.cnttcntrl[i].text;
              }
              print(widget.bon.Quntity[0]);
              await BonsSer.updatetbonCntt(widget.bon.id, widget.bon.Deignation,
                  widget.bon.Quntity, widget.bon.PrixUni, context);
            }, Icons.update),
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
                            height: MediaQuery.of(context).size.height * 0.4491,
                            child: pw.ListView.builder(
                              itemCount: widget.bon.Deignation.length - 1,
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
                                              "${des[index]}"),
                                        ),
                                      ],
                                    )),
                                    pw.Expanded(
                                        child: pw.Text(
                                            textAlign: pw.TextAlign.center,
                                            "${Quntity[index]}")),
                                    pw.Expanded(
                                      child: pw.Text(
                                          textAlign: pw.TextAlign.center,
                                          "${Prixuni[index]}"),
                                    ),
                                    pw.Expanded(
                                        child: pw.Text(
                                            textAlign: pw.TextAlign.center,
                                            "${int.parse(Prixuni[index]) * int.parse(Quntity[index])}")),
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
                            ],
                          )
                        ]),
                  );
                },
              ));
              await Printing.layoutPdf(
                onLayout: (format) async => doc.save(),
              );
            }, Icons.save_alt_rounded),
          ],
        ),
      ),
    );
  }
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
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.normal),
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
