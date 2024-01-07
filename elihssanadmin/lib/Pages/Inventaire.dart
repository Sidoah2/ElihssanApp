import 'package:elihssanadmin/Components/ButtomNav/InventaireNav.dart';
import 'package:elihssanadmin/Components/Searches/StockSer.dart';
import 'package:elihssanadmin/Providers/Inventaire.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Inventaire extends StatefulWidget {
  @override
  State<Inventaire> createState() => _InventaireState();
}

class _InventaireState extends State<Inventaire> {
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
  var montatntotaldesmaterialcntrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0;
        i <
            Provider.of<InventaireProv>(context, listen: false)
                .allaboutcnttProduitObj
                .length;
        i++) {
      cnttsOfAllUsers.add(Provider.of<InventaireProv>(context, listen: false)
          .allaboutcnttProduitObj[i]
          .ProduitInallUsers);
      cntts.add(TextEditingController());
      Isupdated.add(false);
      montanttotal = montanttotal +
          Provider.of<InventaireProv>(context, listen: false)
                  .Allproduits[i]
                  .cntt *
              int.parse(Provider.of<InventaireProv>(context, listen: false)
                  .Allproduits[i]
                  .PrixAchat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  child: StockSer(),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                children: Titres.map((e) => Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text(
                        "$e",
                        textAlign: TextAlign.center,
                      ),
                    ))).toList(),
              ),
              Divider(
                color: Colors.black,
              ),
              Expanded(
                child: Consumer<InventaireProv>(
                  builder: (ctx, produitprov, child) {
                    return ListView.builder(
                      itemCount: produitprov.Allproduits.length,
                      itemBuilder: (ctx1, index) {
                        cntts[index].text =
                            produitprov.Allproduits[index].cntt.toString();
                        return Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(children: [
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                produitprov.Allproduits[index].isupdated
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        ),
                                      )
                                    : Container(),
                                Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].category}"),
                              ],
                            )),
                            Expanded(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].name}")),
                            Expanded(
                                child: TextField(
                              onSubmitted: (value) {
                                Isupdated[index] = true;
                                setState(() {});
                              },
                              textAlign: TextAlign.center,
                              controller: cntts[index],
                            )),
                            Expanded(
                                child: Text(
                              "${cnttsOfAllUsers[index]}",
                              textAlign: TextAlign.center,
                            )),
                            Expanded(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].PrixAchat}")),
                            Expanded(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].ZoneStockage}")),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    textAlign: TextAlign.center,
                                    "${produitprov.Allproduits[index].Fournisseur}"),
                                Isupdated[index]
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: IconButton(
                                            onPressed: () {
                                              produitprov
                                                  .updateQuntityInInventaire(
                                                      produitprov
                                                          .Allproduits[index]
                                                          .id,
                                                      int.parse(
                                                          cntts[index].text),
                                                      "admin",
                                                      context);
                                            },
                                            icon: Icon(
                                              Icons.save_alt_outlined,
                                              color: Colors.green,
                                            )),
                                      )
                                    : Container(),
                              ],
                            )),
                          ]),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Montant Total des Produits :",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "$montanttotal",
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            textAlign: TextAlign.end,
                            "Montant Total des Equipements et Materials :",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            child: TextField(
                              controller: montatntotaldesmaterialcntrl,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: InventaireNav(context),
              )
            ],
          ),
        ),
      )),
    );
  }
}
