import 'package:elihssanadmin/Components/Widgets/AddFournisseur.dart';
import 'package:flutter/material.dart';

import 'BottomNav.dart';

class ButtomIconnFournisseur_2 extends StatefulWidget {
  var ctx;
  ButtomIconnFournisseur_2(this.ctx);
  @override
  State<ButtomIconnFournisseur_2> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<ButtomIconnFournisseur_2> {
  List<String> Titres = [
    "Clients",
    "Region",
    "Adresse",
    "Contact",
    "Montant Total",
    "Montant Payé",
    "Montant restant",
    "Remarques",
    "Dattes"
  ];
  var namecntrl = TextEditingController();
  var categorycntrl = TextEditingController();

  var prixachatcntrl = TextEditingController();

  var cnttcntrl = TextEditingController();

  var cntrl = TextEditingController();

  var zonestockagecntrl = TextEditingController();

  var dateexpcntrl = TextEditingController();
  var prixventcntrl = TextEditingController();
  var fournisseurcntrl = TextEditingController();

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddFournisseur(),
                  ));
            }, Icons.add),
          ],
        ),
      ),
    );
  }
}
