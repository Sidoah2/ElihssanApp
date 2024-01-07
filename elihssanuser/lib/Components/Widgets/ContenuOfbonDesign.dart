import 'package:elihssanuser/Components/Affichage/ContenuOfbonDesignAffichage.dart';
import 'package:elihssanuser/Components/ButtomNav/ContenuOfBonNav.dart';
import 'package:elihssanuser/Objects/Bons.dart';
import 'package:elihssanuser/Services/Bons.dart';
import 'package:flutter/material.dart';

class ContenuOfbonDesign extends StatefulWidget {
  var cntx;
  String Client;
  String NBDV;
  BonsObj bon;

  ContenuOfbonDesign(
      {required this.cntx,
      required this.Client,
      required this.NBDV,
      required this.bon});

  @override
  State<ContenuOfbonDesign> createState() => _DesignBonState();
}

class _DesignBonState extends State<ContenuOfbonDesign> {
  var client = TextEditingController();

  var nbdv = TextEditingController();

  List<String> titres = [
    "Designation",
    "Quntity",
    "Prix Uni (dz)",
    "Total (dz)"
  ];
  List<String> des = [];
  List<String> Prixuni = [];

  List<String> Quntity = [];
  var prixtotalbon = 0;
  List<TextEditingController> cnttcntrl = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < widget.bon.Deignation.length - 1; i++) {
      cnttcntrl.add(TextEditingController());

      des.add(widget.bon.Deignation[i]);
      Quntity.add(widget.bon.Quntity[i]);
      Prixuni.add(widget.bon.PrixUni[i]);
      prixtotalbon =
          prixtotalbon + int.parse(Prixuni[i]) * int.parse(Quntity[i]);
    }
  }

  @override
  Widget build(BuildContext contextg) {
    client.text = widget.Client.toString();
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
      child: ListView(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width * 0.02,
                    horizontal: MediaQuery.of(context).size.width * 0.01),
                child: Container(
                  child: TextField(
                      controller: client,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Nom client")),
                      readOnly: true),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width * 0.02,
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("${widget.NBDV}"),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.black,
        ),
        Row(
          children: titres
              .map((e) => Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        e,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ))))
              .toList(),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.black38,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4491,
          child: ListView.builder(
            itemCount: widget.bon.Deignation.length - 1,
            itemBuilder: (context, index) {
              cnttcntrl[index].text = Quntity[index];

              return Wrap(
                children: [
                  Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.002),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            setState(() {
                                              widget.bon.Deignation
                                                  .removeAt(index);
                                              widget.bon.Quntity
                                                  .removeAt(index);
                                              widget.bon.PrixUni
                                                  .removeAt(index);
                                            });
                                            await BonsSer.updatetbonCntt(
                                                widget.bon.id,
                                                widget.bon.Deignation,
                                                widget.bon.Quntity,
                                                widget.bon.PrixUni,
                                                context);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                      Text(
                                        des[index],
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: TextField(
                                    controller: cnttcntrl[index],
                                  ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${Prixuni[index]}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${int.parse(Prixuni[index]) * int.parse(Quntity[index])}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  )))
                        ],
                      )),
                ],
              );
            },
          ),
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.black38,
        ),
        ContenuOfbonDesignAffichage(prixTotal: prixtotalbon, verssement: 99),
        Container(
          child: ContenuOfBonNav(contextg, widget.Client, widget.NBDV,
              widget.bon, prixtotalbon, 88, cnttcntrl),
        ) //
        // Container(
        //   child: ButtomIconsVerVers_ClientVentPage(widget.cntx),
        // ) // VerVersButtomBonLivraison(
        //   cntx: widget.cntx,
        //   NBDV: widget.NBDV,
        //   ClinetName: widget.Client,
        //   Bon: widget.bon,
        // ),
      ]),
    );
  }
}
