import 'package:elihssanuser/Objects/User.dart';
import 'package:elihssanuser/Pages/Home.dart';
import 'package:elihssanuser/Providers/Depenses.dart';
import 'package:elihssanuser/Providers/Localdb.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';

class DepenseNav extends StatefulWidget {
  var ctx;
  DepenseNav(this.ctx);
  @override
  State<DepenseNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<DepenseNav> {
  List<String> Titres = ["Category", "Date", "Montant"];

  var category = TextEditingController();
  var montant = TextEditingController();
  var user = TextEditingController();
  var type = TextEditingController();
  int Totaldepenses = 0;
  @override
  Widget build(BuildContext context) {
    Totaldepenses =
        Provider.of<DepensesProv>(context, listen: false).Totaldepenses;
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
            Consumer<DepensesProv>(
              builder: (context, depensesProv, child) {
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
                                  itemCount: depensesProv.AllDepenses.length,
                                  itemBuilder: (ctx1, index) {
                                    return pw.Row(children: [
                                      pw.Expanded(
                                          child: pw.Text(
                                              textAlign: pw.TextAlign.center,
                                              "${depensesProv.AllDepenses[index].category}")),
                                      pw.Expanded(
                                        child: pw.Text(
                                            textAlign: pw.TextAlign.center,
                                            "${depensesProv.AllDepenses[index].date.substring(0, 10)}"),
                                      ),
                                      pw.Expanded(
                                          child: pw.Text(
                                              textAlign: pw.TextAlign.center,
                                              "${depensesProv.AllDepenses[index].montant}")),
                                    ]);
                                    ;
                                  },
                                ),
                              ),
                              pw.Divider(
                                thickness: 0.5,
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.all(2.0),
                                child: pw.Row(
                                  mainAxisAlignment: pw.MainAxisAlignment.end,
                                  children: [
                                    pw.Expanded(
                                      child: pw.Container(),
                                    ),
                                    pw.Expanded(
                                        child: pw.Text(
                                            "Montant Total des Depenses (dz)")),
                                    pw.Expanded(
                                      child: pw.Container(
                                        child: pw.Container(
                                          child: pw.Container(
                                            padding: pw.EdgeInsets.all(10),
                                            child: pw.Text("${Totaldepenses}",
                                                textAlign: pw.TextAlign.center),
                                          ),
                                        ),
                                      ),
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
                }, Icons.save_alt_rounded);
              },
            ),
            BotommNaave(() {
              UserObj EmplSelected = UserObj(
                  congees: [],
                  grade: "",
                  id: "",
                  name: "",
                  bons: [],
                  daterec: "",
                  salairej: "",
                  lieu: "",
                  depenses: [],
                  clients: []);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                    title: Text("Add a depense"),
                    content: Wrap(
                      alignment: WrapAlignment.end,
                      children: [
                        build_text_input("Category", category),
                        build_text_input("Montant", montant),
                        build_text_input("For Pesonnel? Entreprise", type),
                        ElevatedButton(
                            onPressed: () async {
                              await Provider.of<DepensesProv>(context,
                                      listen: false)
                                  .Adddepense(
                                      category.text,
                                      montant.text,
                                      Provider.of<LocaldbProv>(context,
                                              listen: false)
                                          .User,
                                      type.text.toLowerCase());
                              Navigator.pop(context);
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
