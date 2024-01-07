import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:elihssanadmin/Components/Widgets/FournisseurChoose.dart';
import 'package:elihssanadmin/Objects/Fournisseur.dart';
import 'package:elihssanadmin/Providers/Produits.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';

class StockNav extends StatefulWidget {
  var ctx;
  StockNav(this.ctx);
  @override
  State<StockNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<StockNav> {
  List<String> Titres = [
    "Category",
    "Produit",
    "Date d'achat",
    "Prix d'achat",
    "Quntity en stock",
    "Zone de stockage",
    "Date d'Exp",
    "Prix de Vent",
    "Fournisseur"
  ];
  late FournisseurObj Fournisseurname;
  var namecntrl = TextEditingController();
  var categorycntrl = TextEditingController();

  var prixachatcntrl = TextEditingController();

  var cnttcntrl = TextEditingController();

  var cntrl = TextEditingController();

  var zonestockagecntrl = TextEditingController();

  var dateexpcntrl = TextEditingController();
  var prixventSubGroscntrl = TextEditingController();
  var fournisseurcntrl = TextEditingController();
  var prixventGroscntrl = TextEditingController();
  var cnttEmblgcntrl = TextEditingController();
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
            }, Icons.home),
            Consumer<ProduitsProv>(
              builder: (context, produitprov, child) {
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
                                  itemCount: produitprov.Allproduits.length,
                                  itemBuilder: (ctx1, index) {
                                    DateTime dateTime;
                                    if (produitprov
                                            .Allproduits[index].dateExp !=
                                        "") {
                                      dateTime = DateTime(
                                          int.parse(produitprov
                                              .Allproduits[index].dateExp
                                              .substring(6, 10)),
                                          int.parse(produitprov
                                              .Allproduits[index].dateExp
                                              .substring(3, 5)),
                                          int.parse(produitprov
                                              .Allproduits[index].dateExp
                                              .substring(0, 2)));
                                    } else {
                                      dateTime = DateTime(0);
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
                                                  "${produitprov.Allproduits[index].category}"),
                                            ),
                                          ],
                                        )),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${produitprov.Allproduits[index].name}")),
                                        pw.Expanded(
                                          child: pw.Text(
                                              textAlign: pw.TextAlign.center,
                                              "${produitprov.Allproduits[index].dateAchat.substring(0, 10)}"),
                                        ),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${produitprov.Allproduits[index].PrixAchat}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${produitprov.Allproduits[index].cntt}")),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${produitprov.Allproduits[index].ZoneStockage}")),
                                        pw.Expanded(
                                            child: dateTime.year != 0
                                                ? pw.Text(
                                                    textAlign:
                                                        pw.TextAlign.center,
                                                    "${dateTime.year}/${dateTime.month}/${dateTime.day}",
                                                  )
                                                : pw.Text(
                                                    textAlign:
                                                        pw.TextAlign.center,
                                                    "/",
                                                  )),
                                        pw.Expanded(
                                            child: pw.Text(
                                          textAlign: pw.TextAlign.center,
                                          "${produitprov.Allproduits[index].prixunigros}",
                                        )),
                                        pw.Expanded(
                                            child: pw.Text(
                                                textAlign: pw.TextAlign.center,
                                                "${produitprov.Allproduits[index].Fournisseur}")),
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
            BotommNaave(() {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: 200,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: categorycntrl,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("category")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: namecntrl,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("name")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: prixachatcntrl,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Prix d'achat")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: cnttcntrl,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Quntity")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: cnttEmblgcntrl,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Quntity d'embalage")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: zonestockagecntrl,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Zone de stockage")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: dateexpcntrl,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Date d'exp")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: prixventGroscntrl,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Prix vent Gros")),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: prixventSubGroscntrl,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Prix vent Sub Gros")),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () async {
                                var f = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FournisseurChoose(),
                                    ));
                                Fournisseurname = f;
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Text("Fournisseur name")),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () async {
                              await show_image_piker(
                                context,
                                namecntrl.text,
                                prixachatcntrl.text,
                                Fournisseurname.name,
                                zonestockagecntrl.text,
                                prixventGroscntrl.text,
                                prixventSubGroscntrl.text,
                                cnttcntrl.text,
                                cnttEmblgcntrl.text,
                                dateexpcntrl.text,
                                categorycntrl.text,
                              );
                            },
                            child: Container(
                              color: Colors.amber,
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Upload Image & Save"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }, Icons.add)
          ],
        ),
      ),
    );
  }
}

show_image_piker(context, name, prixachat, Fournisseur, ZoneStockage,
    prixuniGros, prixuniSubGros, cntt, cnttEmblg, DateExp, Category) async {
  String? base64str;

  Uint8List? bytes;
  final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
  // doc ra7 tefte7 galery  w yreje3 l pohoto li khtarouha f myfile ...fiha path data type......ect
  // bach njibou l path

  bytes = File(myfile!.path).readAsBytesSync();
  base64str = base64Encode(bytes!);
  // upload image and data in server apres in database
  await Provider.of<ProduitsProv>(context, listen: false).AddProduit(
      name,
      prixachat,
      Fournisseur,
      ZoneStockage,
      prixuniGros,
      prixuniSubGros,
      cntt,
      cnttEmblg,
      DateExp,
      Category,
      base64str,
      0,
      context);
}
