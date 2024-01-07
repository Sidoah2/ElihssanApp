import 'package:elihssanadmin/Components/ButtomNav/EmployeesNav.dart';
import 'package:elihssanadmin/Components/Searches/EmployeesSer.dart';
import 'package:elihssanadmin/Providers/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeesSelecte extends StatefulWidget {
  @override
  State<EmployeesSelecte> createState() => _EmployeesState();
}

class _EmployeesState extends State<EmployeesSelecte> {
  List<String> Titres = [
    "Name",
    "lieu de travail",
    "Date de recrutement",
    "Salaire journalier",
    "Montant Totales Des Depenses",
    "Jours de Conge",
    "Jours de travail",
  ];

  List<TextEditingController> daterecs = [];

  List<TextEditingController> jourstravails = [];

  List<TextEditingController> salairejs = [];

  List<TextEditingController> jourscngs = [];
  List<bool> isupdates = [];
  List<int> depenses = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var user
        in Provider.of<UserProv>(context, listen: false).AllaboutEmpl) {
      int p = 0;
      for (var depense in user.depenses) {
        if (depense.type != "entreprise") {
          p = p + int.parse(depense.montant);
        }
      }
      depenses.add(p);
      jourscngs.add(TextEditingController());
      daterecs.add(TextEditingController());
      salairejs.add(TextEditingController());
      jourstravails.add(TextEditingController());
      isupdates.add(false);
    }
    for (var i = 0;
        i < Provider.of<UserProv>(context, listen: false).AllaboutEmpl.length;
        i++) {
      salairejs[i].text = Provider.of<UserProv>(context, listen: false)
          .AllaboutEmpl[i]
          .salairej;
      daterecs[i].text =
          Provider.of<UserProv>(context, listen: false).AllaboutEmpl[i].daterec;
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
                  child: EmployeesSer(),
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
                child: Consumer<UserProv>(
                  builder: (ctx, userProv, child) {
                    return ListView.builder(
                      itemCount: userProv.AllaboutEmpl.length,
                      itemBuilder: (ctx1, index) {
                        return Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                Navigator.pop(
                                    context, userProv.AllaboutEmpl[index]);
                              },
                              child: Row(
                                children: [
                                  isupdates[index]
                                      ? IconButton(
                                          onPressed: () {
                                            userProv
                                                .updateempl(
                                                    userProv
                                                        .AllaboutEmpl[index].id,
                                                    daterecs[index].text,
                                                    salairejs[index].text,
                                                    context)
                                                .then((status) {
                                              if (status == 200) {
                                                setState(() {
                                                  isupdates[index] = false;
                                                });
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            Icons.save_alt_outlined,
                                            color: Colors.green,
                                          ))
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        ),
                                  Expanded(
                                    child: Text(
                                        textAlign: TextAlign.center,
                                        "${userProv.AllaboutEmpl[index].name}"),
                                  ),
                                ],
                              ),
                            )),
                            Expanded(
                                child: Text(
                              textAlign: TextAlign.center,
                              "${userProv.AllaboutEmpl[index].lieu}",
                            )),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: daterecs[index],
                                  onTap: () {
                                    isupdates[index] = true;
                                    setState(() {});
                                  },
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: salairejs[index],
                                onTap: () {
                                  isupdates[index] = true;
                                  setState(() {});
                                },
                                textAlign: TextAlign.center,
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  textAlign: TextAlign.center,
                                  "${depenses[index]}"),
                            )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: jourscngs[index],
                                onTap: () {
                                  isupdates[index] = true;
                                  setState(() {});
                                },
                                textAlign: TextAlign.center,
                              ),
                            )),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: jourstravails[index],
                                onTap: () {
                                  isupdates[index] = true;
                                  setState(() {});
                                },
                                textAlign: TextAlign.center,
                              ),
                            )),
                          ]),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                child: EmployeesNav(context),
              )
            ],
          ),
        ),
      )),
    );
  }
}
