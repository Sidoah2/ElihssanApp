import 'package:flutter/material.dart';

class VentVersAffichage extends StatelessWidget {
  var prixTotal;
  var verssement;

  var Montanttotal = TextEditingController(text: "0");
  var Montanttotalverss = TextEditingController(text: "0");

  var Montanttotalrest = TextEditingController(text: "0");

  VentVersAffichage({required this.prixTotal, required this.verssement});

  @override
  Widget build(BuildContext context) {
    Montanttotal.text = prixTotal.toString();
    Montanttotalverss.text = verssement.toString();

    Montanttotalrest.text = (prixTotal - verssement).toString();

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
        Padding(
          padding: const EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Expanded(child: Text("Verssement (dz)")),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      enabled: false,
                      controller: Montanttotalverss,
                      decoration: const InputDecoration(),
                      readOnly: true),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Expanded(child: Text("Restant (dz)")),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      enabled: false,
                      controller: Montanttotalrest,
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
