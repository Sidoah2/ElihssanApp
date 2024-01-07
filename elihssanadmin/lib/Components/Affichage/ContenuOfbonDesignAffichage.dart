import 'package:flutter/material.dart';

class ContenuOfbonDesignAffichage extends StatelessWidget {
  var prixTotal;
  var verssement;

  var Montanttotal = TextEditingController(text: "0");

  ContenuOfbonDesignAffichage(
      {required this.prixTotal, required this.verssement});

  @override
  Widget build(BuildContext context) {
    Montanttotal.text = prixTotal.toString();
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
