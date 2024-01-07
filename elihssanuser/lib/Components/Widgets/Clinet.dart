import 'package:elihssanuser/Providers/Clients.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectCLient extends StatelessWidget {
  SelectCLient({super.key});
  List<String> Titres = [
    "Clients",
    "Region",
    "Contact",
    "Montant Total",
    "Montant Payé",
    "Montant restant",
    "Remarques"
  ];

  @override
  Widget build(BuildContext contextg) {
    List<int> PrixTotals = [];
    return MaterialApp(
      home: SafeArea(child: Scaffold(
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
                                        child: InkWell(
                                      onTap: () {
                                        Navigator.pop(contextg,
                                            clientsProv.AllAboutClient[index]);
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${clientsProv.AllAboutClient[index].client.name}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    )),
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
