import 'package:elihssanadmin/Objects/User.dart';
import 'package:elihssanadmin/Providers/Congges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';

class CongeeNav extends StatefulWidget {
  var ctx;
  UserObj user;

  CongeeNav(this.ctx, this.user);
  @override
  State<CongeeNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<CongeeNav> {
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
              Navigator.pop(widget.ctx);
            }, Icons.arrow_back_ios),
            // BotommNaave(() async {
            //   final doc = pw.Document();
            //   doc.addPage(pw.Page(
            //     orientation: pw.PageOrientation.landscape,
            //     build: (ctx) {
            //       // return pdf page qui on va le enregistrer
            //       return pw.Container(
            //         child: pw.Column(
            //             crossAxisAlignment: pw.CrossAxisAlignment.start,
            //             children: [
            //               pw.Divider(
            //                 thickness: 0.5,
            //               ),
            //               pw.Row(
            //                 children: Titres.map((e) => pw.Expanded(
            //                     child: pw.Container(
            //                         alignment: pw.Alignment.center,
            //                         child: pw.Text(
            //                           textAlign: pw.TextAlign.center,
            //                           e,
            //                           style: const pw.TextStyle(
            //                             fontSize: 15,
            //                           ),
            //                         )))).toList(),
            //               ),
            //               pw.Divider(
            //                 thickness: 0.5,
            //               ),
            //               pw.Container(
            //                 height: MediaQuery.of(context).size.height * 0.4491,
            //                 child: pw.ListView.builder(
            //                   itemCount: 0,
            //                   itemBuilder: (ctx1, index) {
            //                     return pw.Padding(
            //                       padding: const pw.EdgeInsets.all(0.0),
            //                       child: pw.Row(children: [
            //                         pw.Expanded(
            //                             child: pw.Row(
            //                           mainAxisAlignment:
            //                               pw.MainAxisAlignment.spaceBetween,
            //                           children: [
            //                             pw.Expanded(
            //                               child: pw.Text(
            //                                   textAlign: pw.TextAlign.center,
            //                                   "s"),
            //                             ),
            //                           ],
            //                         )),
            //                         pw.Expanded(
            //                             child: pw.Text(
            //                                 textAlign: pw.TextAlign.center,
            //                                 "a")),
            //                         pw.Expanded(
            //                             child: pw.Text(
            //                                 textAlign: pw.TextAlign.center,
            //                                 "a")),
            //                         pw.Expanded(
            //                             child: pw.Text(
            //                                 textAlign: pw.TextAlign.center,
            //                                 "a")),
            //                         pw.Expanded(
            //                             child: pw.Text(
            //                                 textAlign: pw.TextAlign.center,
            //                                 "a")),
            //                       ]),
            //                     );
            //                     ;
            //                   },
            //                 ),
            //               ),
            //               pw.Divider(
            //                 thickness: 0.5,
            //               ),
            //               pw.Column(
            //                 crossAxisAlignment: pw.CrossAxisAlignment.start,
            //                 children: [
            //                   pw.Padding(
            //                     padding: const pw.EdgeInsets.all(2),
            //                     child: pw.Row(
            //                       mainAxisAlignment: pw.MainAxisAlignment.end,
            //                       children: [
            //                         pw.Expanded(
            //                           child: pw.Container(),
            //                           flex: 1,
            //                         ),
            //                         pw.Expanded(
            //                             child: pw.Text("Montant Total (dz)")),
            //                         pw.Expanded(
            //                           flex: 1,
            //                           child: pw.Container(
            //                             child: pw.Container(
            //                               padding: pw.EdgeInsets.all(10),
            //                               // decoration: pw.BoxDecoration(
            //                               //     border: pw.Border.all()),
            //                               child: pw.Text("z",
            //                                   textAlign: pw.TextAlign.center),
            //                             ),
            //                           ),
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ]),
            //       );
            //     },
            //   ));
            //   await Printing.layoutPdf(
            //     onLayout: (format) async => doc.save(),
            //   );
            // }, Icons.save_alt_rounded),
            InkWell(
                onTap: () {
                  Provider.of<CongeesProv>(context, listen: false)
                      .AddDateDepart(widget.user.name, widget.ctx);
                },
                child: Text(
                  "Add Date de depart",
                  style: TextStyle(color: Colors.white),
                )),
            InkWell(
                onTap: () {
                  Provider.of<CongeesProv>(context, listen: false)
                      .AddDateArvOfCurrentCongee(widget.user.name, widget.ctx);
                },
                child: Text("Add Date d'arrivee de la congee",
                    style: TextStyle(color: Colors.white))),
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
