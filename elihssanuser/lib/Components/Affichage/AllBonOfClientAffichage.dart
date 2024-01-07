import 'package:flutter/material.dart';

class AllBonOfClientAffichage extends StatefulWidget {
  var prixTotal;
  var verssement;

  AllBonOfClientAffichage({required this.prixTotal, required this.verssement});

  @override
  State<AllBonOfClientAffichage> createState() => _SummerBonState();
}

class _SummerBonState extends State<AllBonOfClientAffichage> {
  static var Versemment = TextEditingController(text: "0");

  var Montanttotal = TextEditingController(text: "0");
  var reste = TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(),
                flex: 1,
              ),
              Expanded(child: Text("Versement (dz)")),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextField(
                    enabled: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    controller: Versemment,
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
              Expanded(child: Text("Restant (dz)")),
              Expanded(
                flex: 1,
                child: Container(
                  child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      enabled: false,
                      controller: reste,
                      decoration: const InputDecoration(),
                      readOnly: true),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
