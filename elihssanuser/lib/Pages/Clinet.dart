import 'package:elihssanuser/Components/ButtomNav/ClientsNav.dart';
import 'package:elihssanuser/Providers/Clients.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CLient extends StatelessWidget {
  CLient({super.key});
  List<String> Titres = [
    "Clients",
    "Region",
    "Adresse",
    "Contact",
    "Montant Total",
    "Montant Payé",
    "Montant restant",
    "Remarques"
  ];

  @override
  Widget build(BuildContext context) {
    List<int> PrixTotals = [];
    return MaterialApp(
      home: SafeArea(child: Scaffold(
        // floatingActionButtonLocation:
        //     FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: ButtomIconsClinets(context),
        body: Consumer<ClientsProv>(
          builder: (context, clientsProv, child) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.002,
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: Colors.black,
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
                    Divider(
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemCount: clientsProv.AllAboutClient.length,
                          itemBuilder: (context, index) {
                            for (var client in clientsProv.AllAboutClient) {
                              int prixtotal = 0;
                              for (var i = 0; i < client.bons.length; i++) {
                                prixtotal = prixtotal +
                                    int.parse(client.bons[i].Prixtotalbon);
                              }
                              PrixTotals.add(prixtotal);
                            }
                            return Container(
                                padding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.002),
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${clientsProv.AllAboutClient[index].client.name}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${clientsProv.AllAboutClient[index].client.region}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${clientsProv.AllAboutClient[index].client.adress}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${clientsProv.AllAboutClient[index].client.contact}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${PrixTotals[index]}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${clientsProv.AllAboutClient[index].client.verss}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${PrixTotals[index] - int.parse(clientsProv.AllAboutClient[index].client.verss)}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ))),
                                    Expanded(
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${clientsProv.AllAboutClient[index].client.remarques}",
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
                    Container(
                      child: ClientsNav(context),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      )),
      debugShowCheckedModeBanner: false,
    );
  }
}
