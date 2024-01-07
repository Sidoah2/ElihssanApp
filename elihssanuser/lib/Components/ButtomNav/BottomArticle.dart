import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:elihssanuser/Components/ButtomNav/BottomNav.dart';
import 'package:elihssanuser/Objects/Clients.dart';
import 'package:elihssanuser/Providers/ArticlePropoProv.dart';
import 'package:elihssanuser/Providers/Localdb.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ButtomArticle extends StatefulWidget {
  var cntx;
  ButtomArticle({required this.cntx});
  @override
  State<ButtomArticle> createState() => _ButtomCatalogueState();
}

class _ButtomCatalogueState extends State<ButtomArticle> {
  String? base64str;

  Uint8List? bytes;

  var obsCntrl = TextEditingController(text: "");
  var nameproduitCntrl = TextEditingController(text: "");

  ClientObj client = ClientObj(
      IdUser: "",
      id: -1,
      name: "",
      adress: "",
      contact: "",
      region: "",
      remarques: "",
      verss: "");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
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
              Navigator.pop(widget.cntx);
            }, Icons.home),
            BotommNaave(() async {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Container(
                    child: Wrap(
                      children: [
                        Center(child: Text("Add a Article")),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                            controller: nameproduitCntrl,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              label: Text("Nom De Produit"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextField(
                            controller: obsCntrl,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              label: Text("Observation"),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            await show_image_piker(
                                obsCntrl.text, nameproduitCntrl.text);
                          },
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Save"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }, Icons.add),
          ],
        ),
      ),
    );
  }

  show_image_piker(obs, nameproduit) async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    // doc ra7 tefte7 galery  w yreje3 l pohoto li khtarouha f myfile ...fiha path data type......ect
    // bach njibou l path

    bytes = File(myfile!.path).readAsBytesSync();
    base64str = base64Encode(bytes!);

    await Provider.of<ArticlePropoProv>(context, listen: false).AddArticles(
        obs,
        nameproduit,
        base64str,
        context,
        Provider.of<LocaldbProv>(context, listen: false).User);

    // upload image and data in server apres in database
  }
}

// buildprintdata(Image) => pw.Padding(
//     padding: pw.EdgeInsets.all(10),
//     child: pw.Container(child: pw.Text("kkkkkkkkkk")));
