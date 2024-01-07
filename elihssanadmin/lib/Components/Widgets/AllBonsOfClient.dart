import 'package:elihssanadmin/Components/Affichage/AllBonOfClientAffichage.dart';
import 'package:elihssanadmin/Components/ButtomNav/ALlBonOfClientNav.dart';
import 'package:elihssanadmin/Components/Widgets/ContenuOfBon.dart';
import 'package:elihssanadmin/Objects/Bons.dart';
import 'package:elihssanadmin/Objects/Clients.dart';
import 'package:flutter/material.dart';

class AllBonOfClient extends StatefulWidget {
  List<BonsObj> allbon;
  int prixtotal;

  ClientObj Client;
  AllBonOfClient(this.allbon, this.prixtotal, this.Client);

  @override
  State<AllBonOfClient> createState() => _AllBonOfClientState();
}

class _AllBonOfClientState extends State<AllBonOfClient> {
  List<String> Titres = ["N° Bon de Livraison", "Date", "Montant"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext contextg) {
    print("zz${widget.prixtotal}");
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        widget.Client.name,
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: Titres.map((e) => Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            e,
                            textAlign: TextAlign.center,
                          ),
                        )))).toList(),
              ),
              const Divider(
                color: Colors.black,
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: widget.allbon.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.002),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ContenuOfBon(
                                            bon: widget.allbon[index],
                                            Client: widget.Client,
                                            NBDV:
                                                "${widget.allbon[index].NBDV}"),
                                      ));
                                },
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${widget.allbon[index].NBDV}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                              )),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${widget.allbon[index].date.substring(0, 10)}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      ))),
                              Expanded(
                                  child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${widget.allbon[index].Prixtotalbon}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )))
                            ],
                          ));
                    },
                  ),
                ),
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black38,
              ),
              AllBonOfClientAffichage(
                prixTotal: widget.prixtotal,
                verssement: int.parse(widget.Client.verss),
              ),

              // ButtomClientVent(
              //     ClientName: NameClient,
              //     cntx: context,
              //     allbon: allbon,
              //     prixtotal: prixtotal,
              //
              //   prixtotalVers: prixtotalVers)
              Container(
                child: ALlBonOfClientNav(widget.Client, contextg, widget.allbon,
                    widget.prixtotal, int.parse(widget.Client.verss)),
              ) //
            ],
          ),
        ),
      )),
    );
  }
}
