import 'package:elihssanuser/Providers/BonLivraison.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SummerBon extends StatefulWidget {
  var prixTotal;
  SummerBon({required this.prixTotal});

  @override
  State<SummerBon> createState() => _SummerBonState();
}

class _SummerBonState extends State<SummerBon> {
  static var Versemment = TextEditingController(text: "0");

  var Montanttotal = TextEditingController(text: "0");
  var reste = TextEditingController(text: "0");

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
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    controller: Versemment,
                    onChanged: (value) {
                      Provider.of<BonLivraisonProv>(context, listen: false)
                          .bon
                          .verssement = value;
                      reste.text =
                          (widget.prixTotal - int.parse(value)).toString();
                    },
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
