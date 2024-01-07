import 'package:elihssanuser/Components/Affichage/VentVersAffichage.dart';
import 'package:elihssanuser/Components/ButtomNav/VerVersNav.dart';
import 'package:elihssanuser/Components/Widgets/AllBonsOfClient.dart';
import 'package:elihssanuser/Providers/Clients.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VentVers extends StatefulWidget {
  VentVers({super.key});

  @override
  State<VentVers> createState() => _VentVersemmentPAgeState();
}

class _VentVersemmentPAgeState extends State<VentVers> {
  List<String> Titres = [
    "Clients",
    "Adress Client",
    "Montant Total",
    "Montant Payé",
    "Montant restant"
  ];
  List<int> prixtotal = [];
  int allmontant = 0;
  int allmontantverss = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var client
        in Provider.of<ClientsProv>(context, listen: false).AllAboutClient) {
      int p = 0;
      allmontantverss = allmontantverss + int.parse(client.client.verss);
      for (var bon in client.bons) {
        p = p + int.parse(bon.Prixtotalbon);
        allmontant = allmontant + int.parse(bon.Prixtotalbon);
      }
      prixtotal.add(p);
    }
  }

  @override
  Widget build(BuildContext contextg) {
    print(allmontant);
    return MaterialApp(
      home: SafeArea(child: Scaffold(
        body: Consumer<ClientsProv>(
          builder: (context, clientsProv, child) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.002,
                  horizontal: MediaQuery.of(context).size.width * 0.02),
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
                                            builder: (context) =>
                                                AllBonOfClient(
                                                    clientsProv
                                                        .AllAboutClient[index]
                                                        .bons,
                                                    prixtotal[index],
                                                    clientsProv
                                                        .AllAboutClient[index]
                                                        .client),
                                          ));
                                    },
                                    child: Container(
                                        padding: EdgeInsets.all(5),
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
                                            "${clientsProv.AllAboutClient[index].client.adress}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${prixtotal[index]}",
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
                                            "${prixtotal[index] - int.parse(clientsProv.AllAboutClient[index].client.verss)}",
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
                  VentVersAffichage(
                      prixTotal: allmontant, verssement: allmontantverss),
                  Container(
                    child: VentVersNav(contextg, clientsProv.AllAboutClient,
                        prixtotal, allmontant, allmontantverss),
                  )
                ],
              ),
            );
          },
        ),
      )),
      debugShowCheckedModeBanner: false,
    );
  }
}
