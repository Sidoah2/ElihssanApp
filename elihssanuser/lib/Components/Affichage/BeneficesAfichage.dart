import 'package:flutter/material.dart';

class BeneficesAfichage extends StatefulWidget {
  var prixTotal;
  var verssement;
  var montantTotaldepenses;

  BeneficesAfichage(
      {required this.prixTotal,
      required this.verssement,
      required this.montantTotaldepenses});

  @override
  State<BeneficesAfichage> createState() => _SummerBonState();
}

class _SummerBonState extends State<BeneficesAfichage> {
  var Versemment = TextEditingController(text: "0");

  var Montanttotal = TextEditingController(text: "0");
  var reste = TextEditingController(text: "0");
  var montanttotaledesdepenses = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    montanttotaledesdepenses.text = widget.montantTotaldepenses.toString();
    Versemment.text = widget.verssement.toString();
    Montanttotal.text = widget.prixTotal.toString();
    reste.text = (widget.prixTotal - widget.verssement).toString();

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
              Expanded(child: Text("Montant Total des ventes (dz)")),
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
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Expanded(child: Text("Montant Total des Credit (dz)")),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextField(
                    enabled: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    controller: reste,
                    decoration: const InputDecoration(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Expanded(child: Text("Montant Total des Revenues (dz)")),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      enabled: false,
                      controller: Versemment,
                      decoration: const InputDecoration(),
                      readOnly: true),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Expanded(child: Text("Montant Total des Depenses (dz)")),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextField(
                    enabled: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    controller: montanttotaledesdepenses,
                    decoration: const InputDecoration(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
