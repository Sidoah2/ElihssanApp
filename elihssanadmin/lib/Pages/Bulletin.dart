import 'package:elihssanadmin/Components/ButtomNav/BullteinNav.dart';
import 'package:elihssanadmin/Objects/Depense.dart';
import 'package:elihssanadmin/Objects/User.dart';
import 'package:flutter/material.dart';

class Bulletin extends StatefulWidget {
  UserObj user;
  int totaldepenses;
  Bulletin({required this.user, required this.totaldepenses});

  @override
  State<Bulletin> createState() => _BulletinState();
}

class _BulletinState extends State<Bulletin> {
  List<String> Titres = ["Category de depense", "Montant (dz)", "Date "];
  int cngs = 0;
  int JoursTravail = 0;

  List<DepenseObj> depenses = [];

  @override
  Widget build(BuildContext context) {
    for (var depense in widget.user.depenses) {
      if (depense.type != "entreprise") {
        depenses.add(depense);
      }
    }
    for (var congge in widget.user.congees) {
      if (congge.arrivee != "dd/mm/yyyy") {
        DateTime depart = DateTime.parse(
            "${congge.depart.substring(6, 10)}-${congge.depart.substring(3, 5)}-${congge.depart.substring(0, 2)}");
        DateTime arrivee = DateTime.parse(
            "${congge.arrivee.substring(6, 10)}-${congge.arrivee.substring(3, 5)}-${congge.arrivee.substring(0, 2)}");
        Duration diff = arrivee.difference(depart);
        cngs = cngs + diff.inDays;
      }
      if (widget.user.daterec != "dd/mm/yyyy") {
        DateTime recrutement = DateTime.parse(
            "${widget.user.daterec.substring(6, 10)}-${widget.user.daterec.substring(3, 5)}-${widget.user.daterec.substring(0, 2)}");
        DateTime now = DateTime.now();
        Duration difftravail = now.difference(recrutement);
        JoursTravail = JoursTravail + difftravail.inDays;
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Name :"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("${widget.user.name}"),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Congees :"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("$cngs"),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Lieu De Travail :"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("${widget.user.lieu}"),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text("Jours de Travail :"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text("${JoursTravail - cngs}"),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Date de recrutement :"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("${widget.user.daterec}"),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(""),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(""),
                      )
                    ],
                  ),
                ],
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
                  child: Container(
                      child: ListView.builder(
                itemCount: depenses.length,
                itemBuilder: (ctx1, index) {
                  return Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(children: [
                      Expanded(
                          child: Text(
                        textAlign: TextAlign.center,
                        "${depenses[index].type}",
                      )),
                      Expanded(
                          child: Text(
                        textAlign: TextAlign.center,
                        "${depenses[index].montant}",
                      )),
                      Expanded(
                          child: Text(
                        textAlign: TextAlign.center,
                        "${depenses[index].date.substring(0, 10)}",
                      )),
                    ]),
                  );
                },
              ))),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Total des droits financiers des salaries :"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: widget.user.salairej != "0"
                          ? Text(
                              "${(int.parse(widget.user.salairej) * (JoursTravail - cngs)) - widget.totaldepenses}")
                          : Text("0"),
                    ),
                  ],
                ),
              ),
              Container(
                child: BulletinNav(context, widget.user, widget.totaldepenses),
              )
            ],
          ),
        ),
      )),
    );
  }
}
