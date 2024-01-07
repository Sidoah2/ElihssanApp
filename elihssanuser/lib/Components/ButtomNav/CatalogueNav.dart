import 'package:elihssanuser/Components/Widgets/Bon_Livraison.dart';
import 'package:elihssanuser/Components/Widgets/Clinet%20copy.dart';
import 'package:elihssanuser/Helpers/initialisations.dart';
import 'package:elihssanuser/Objects/Allaboutclient.dart';
import 'package:elihssanuser/Objects/Clients.dart';
import 'package:elihssanuser/Pages/Home.dart';
import 'package:elihssanuser/Providers/BonLivraison.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BottomNav.dart';

class CatalogueNav extends StatefulWidget {
  var ctx;
  CatalogueNav(
    this.ctx,
  );
  @override
  State<CatalogueNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<CatalogueNav> {
  String Fournisseurname = "";
  AllAboutClientObjet client = AllAboutClientObjet(
      client: ClientObj(
          id: "",
          name: "",
          region: "",
          IdUser: "",
          adress: "",
          verss: "",
          contact: "",
          remarques: ""),
      bons: []);
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
              Initialisation.IniBon(context);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                  (route) => false);
            }, Icons.home),
            BotommNaave(() async {
              client = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CLientSelect(),
                  ));
            }, Icons.add),
            BotommNaave(() async {
              String NBDV =
                  "${DateTime.now().year}/${DateTime.now().millisecondsSinceEpoch.toString().substring(0, 8)}";
              Provider.of<BonLivraisonProv>(context, listen: false).bon.NBDV =
                  NBDV;
              Provider.of<BonLivraisonProv>(context, listen: false)
                  .bon
                  .oldverss = client.client.verss;
              Provider.of<BonLivraisonProv>(context, listen: false)
                  .bon
                  .IdClient = client.client.id;
              Provider.of<BonLivraisonProv>(context, listen: false)
                  .bon
                  .IdClient = client.client.id;
              if (client.client.name != "") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BonLivraison(client.client.name, "${NBDV}"),
                    ));
              }
            }, Icons.list)
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
