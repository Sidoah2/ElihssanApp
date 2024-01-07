import 'package:flutter/material.dart';

class Achat1Affichage extends StatefulWidget {
  var prixTotal;

  Achat1Affichage({
    required this.prixTotal,
  });

  @override
  State<Achat1Affichage> createState() => _SummerBonState();
}

class _SummerBonState extends State<Achat1Affichage> {
  var Montanttotal = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    Montanttotal.text = widget.prixTotal.toString();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Expanded(child: Text("Montant Total (dz)")),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      enabled: false,
                      controller: Montanttotal,
                      decoration: const InputDecoration(),
                      readOnly: true),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
