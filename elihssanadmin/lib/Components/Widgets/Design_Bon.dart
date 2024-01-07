import 'package:elihssanadmin/Components/ButtomNav/BonLivraisonNav.dart';
import 'package:elihssanadmin/Components/Widgets/summer.dart';
import 'package:elihssanadmin/Providers/BonLivraison.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DesignBon extends StatefulWidget {
  String NBDV, ClientName;
  DesignBon(this.ClientName, this.NBDV);
  @override
  State<DesignBon> createState() => _DesignBonState();
}

class _DesignBonState extends State<DesignBon> {
  var PrixTotalOfBon = 0;
  var client = TextEditingController();

  var nbdv = TextEditingController();
  List<TextEditingController> cnttcntrls = [];

  List<String> titres = [
    "Designation",
    "Quntity",
    "Prix Uni (dz)",
    "Total (dz)"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0;
        i <
            Provider.of<BonLivraisonProv>(context, listen: false)
                .AllProduitsSlected
                .length;
        i++) {
      PrixTotalOfBon = PrixTotalOfBon +
          int.parse(Provider.of<BonLivraisonProv>(context, listen: false)
                  .AllProduitsSlected[i]
                  .Prixuni) *
              int.parse(Provider.of<BonLivraisonProv>(context, listen: false)
                  .AllProduitsSlected[i]
                  .Quntity);
      cnttcntrls.add(TextEditingController());
    }
    Provider.of<BonLivraisonProv>(context, listen: false).bon.Prixtotalbon =
        PrixTotalOfBon.toString();
  }

  @override
  Widget build(BuildContext context) {
    client.text = widget.ClientName;
    nbdv.text = widget.NBDV;

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
                  child: TextField(
                      readOnly: true,
                      controller: nbdv,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("N°BDV"),
                          hintText: "2192507")),
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
        Consumer<BonLivraisonProv>(
          builder: (context, bonLivraisonProv, child) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.4491,
              child: ListView.builder(
                itemCount: bonLivraisonProv.AllProduitsSlected.length,
                itemBuilder: (context, index) {
                  int PrixtotalOfItem = int.parse(
                          bonLivraisonProv.AllProduitsSlected[index].Quntity) *
                      int.parse(
                          bonLivraisonProv.AllProduitsSlected[index].Prixuni);
                  cnttcntrls[index].text =
                      bonLivraisonProv.AllProduitsSlected[index].Quntity;

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
                                      child: Text(
                                        bonLivraisonProv
                                            .AllProduitsSlected[index]
                                            .Designation,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ))),
                              Expanded(
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      alignment: Alignment.center,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {
                                          setState(() {
                                            if (value == "") {
                                              value = "0";
                                              bonLivraisonProv
                                                  .AllProduitsSlected[index]
                                                  .Quntity = "0";
                                              PrixTotalOfBon = 0;

                                              for (var i = 0;
                                                  i <
                                                      Provider.of<BonLivraisonProv>(
                                                              context,
                                                              listen: false)
                                                          .AllProduitsSlected
                                                          .length;
                                                  i++) {
                                                PrixTotalOfBon = PrixTotalOfBon +
                                                    int.parse(Provider.of<
                                                                    BonLivraisonProv>(
                                                                context,
                                                                listen: false)
                                                            .AllProduitsSlected[
                                                                i]
                                                            .Prixuni) *
                                                        int.parse(Provider.of<
                                                                    BonLivraisonProv>(
                                                                context,
                                                                listen: false)
                                                            .AllProduitsSlected[
                                                                i]
                                                            .Quntity);
                                                cnttcntrls.add(
                                                    TextEditingController());
                                                Provider.of<BonLivraisonProv>(
                                                            context,
                                                            listen: false)
                                                        .bon
                                                        .Prixtotalbon =
                                                    PrixTotalOfBon.toString();
                                              }
                                            } else {
                                              bonLivraisonProv
                                                  .AllProduitsSlected[index]
                                                  .Quntity = value;
                                              PrixTotalOfBon = 0;
                                              for (var i = 0;
                                                  i <
                                                      Provider.of<BonLivraisonProv>(
                                                              context,
                                                              listen: false)
                                                          .AllProduitsSlected
                                                          .length;
                                                  i++) {
                                                PrixTotalOfBon = PrixTotalOfBon +
                                                    int.parse(Provider.of<
                                                                    BonLivraisonProv>(
                                                                context,
                                                                listen: false)
                                                            .AllProduitsSlected[
                                                                i]
                                                            .Prixuni) *
                                                        int.parse(Provider.of<
                                                                    BonLivraisonProv>(
                                                                context,
                                                                listen: false)
                                                            .AllProduitsSlected[
                                                                i]
                                                            .Quntity);
                                                cnttcntrls.add(
                                                    TextEditingController());
                                                Provider.of<BonLivraisonProv>(
                                                            context,
                                                            listen: false)
                                                        .bon
                                                        .Prixtotalbon =
                                                    PrixTotalOfBon.toString();
                                              }
                                            }
                                          });
                                        },
                                        // controller: cnttcntrls[index],
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${bonLivraisonProv.AllProduitsSlected[index].Prixuni}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${PrixtotalOfItem}",
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
            );
          },
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.black38,
        ),
        SummerBon(prixTotal: PrixTotalOfBon),
        Container(
          child: BonLivraisonNav(context, PrixTotalOfBon),
        )
      ]),
    );
  }
}
