import 'package:elihssanuser/Components/Widgets/ListInventaire.dart';
import 'package:flutter/material.dart';

import 'BottomNav.dart';

class InventaireNav extends StatefulWidget {
  var ctx;
  InventaireNav(this.ctx);
  @override
  State<InventaireNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<InventaireNav> {
  List<String> Titres = [
    "Category",
    "Produit",
    "Quntity en stock (admin)",
    "Quntity en stock (Users)",
    "Prix d'achat",
    "Zone de stockage",
    "Fournisseur"
  ];
  List<TextEditingController> cntts = [];
  List<bool> Isupdated = [];
  List<int> cnttsOfAllUsers = [];
  int montanttotal = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            BotommNaave(() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListInventaire(),
                  ));
            }, Icons.list_alt),
          ],
        ),
      ),
    );
  }
}
