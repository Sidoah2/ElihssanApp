import 'package:elihssanadmin/Components/Widgets/Clinet.dart';
import 'package:elihssanadmin/Objects/Allaboutclient.dart';
import 'package:elihssanadmin/Pages/Home.dart';
import 'package:elihssanadmin/Providers/Clients.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';

class VentVersNav extends StatefulWidget {
  var ctx;
  List<int> prixtotal;
  List<AllAboutClientObjet> aboutClientObjet;
  int allmontant, allmontantverss;
  VentVersNav(this.ctx, this.aboutClientObjet, this.prixtotal, this.allmontant,
      this.allmontantverss);
  @override
  State<VentVersNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<VentVersNav> {
  List<String> Titres = [
    "User",
    "Clients",
    "Adress Client",
    "Montant Total",
    "Montant Payé",
    "Montant restant"
  ];
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
                              itemCount: widget.aboutClientObjet.length,
                              itemBuilder: (ctx1, index) {
                                return pw.Padding(
                                  padding: const pw.EdgeInsets.all(0.0),
                                  child: pw.Row(children: [
                                    pw.Expanded(
                                        child: pw.Text(
                                            textAlign: pw.TextAlign.center,
                                            "${widget.aboutClientObjet[index].client.IdUser}")),
                                    pw.Expanded(
                                        child: pw.Text(
                                            textAlign: pw.TextAlign.center,
                                            "${widget.aboutClientObjet[index].client.name}")),
                                    pw.Expanded(
                                        child: pw.Text(
                                            textAlign: pw.TextAlign.center,
                                            "${widget.aboutClientObjet[index].client.adress}")),
                                    pw.Expanded(
                                        child: pw.Text(
                                            textAlign: pw.TextAlign.center,
                                            "${widget.prixtotal[index]}")),
                                    pw.Expanded(
                                        child: pw.Text(
                                            textAlign: pw.TextAlign.center,
                                            "${widget.aboutClientObjet[index].client.verss}")),
                                    pw.Expanded(
                                      child: pw.Text(
                                          textAlign: pw.TextAlign.center,
                                          "${widget.prixtotal[index] - int.parse(widget.aboutClientObjet[index].client.verss)}"),
                                    ),
                                  ]),
                                );
                              },
                            ),
                          ),
                          pw.Divider(
                            thickness: 0.5,
                          ),
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
                                    child: pw.Text("${widget.allmontant}"),
                                  )),
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(2),
                            child: pw.Row(
                              mainAxisAlignment: pw.MainAxisAlignment.end,
                              children: [
                                pw.Expanded(
                                  child: pw.Container(),
                                  flex: 1,
                                ),
                                pw.Expanded(child: pw.Text("Verssement (dz)")),
                                pw.Expanded(
                                  flex: 1,
                                  child: pw.Container(
                                      child: pw.Container(
                                    child: pw.Text("${widget.allmontantverss}"),
                                  )),
                                ),
                              ],
                            ),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(2),
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
                                    child: pw.Text(
                                        "${widget.allmontant - widget.allmontantverss}"),
                                  )),
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
            }, Icons.save_alt_rounded),
            BotommNaave(() {
              late AllAboutClientObjet aboutClientObjet;
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                    title: Text("Add a Verssement"),
                    content: Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () async {
                              aboutClientObjet = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SelectCLient(),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text("SelectClient"),
                              ),
                            ),
                          ),
                        ),
                        build_text_input("Montant", montant),
                        ElevatedButton(
                            onPressed: () async {
                              // update verss in client
                              int newverss = int.parse(montant.text) +
                                  int.parse(aboutClientObjet.client.verss);
                              await Provider.of<ClientsProv>(context,
                                      listen: false)
                                  .updateClient(aboutClientObjet.client.id,
                                      newverss, context);
                            },
                            child: Text("Save"),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.amber)))
                      ],
                    )),
              );
            }, Icons.add),
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
