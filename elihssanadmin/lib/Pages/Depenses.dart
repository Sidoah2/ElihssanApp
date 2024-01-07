import 'package:elihssanadmin/Components/ButtomNav/DepenseNav.dart';
import 'package:elihssanadmin/Components/Searches/DepenseSearch.dart';
import 'package:elihssanadmin/Providers/Depenses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Depenses extends StatefulWidget {
  Depenses({super.key});

  @override
  State<Depenses> createState() => _DepensesPageState();
}

class _DepensesPageState extends State<Depenses> {
  List<String> Titres = ["User", "Category", "Date", "Montant"];

  var TotalDepenses = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      TotalDepenses =
          Provider.of<DepensesProv>(context, listen: false).Totaldepenses;
    });
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
                  child: DepenseSearch(),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    Expanded(child: Text("Total Des Depenses :")),
                    Expanded(
                      flex: 1,
                      child: Container(
                          alignment: Alignment.center,
                          child: Text("${TotalDepenses}")),
                    ),
                  ],
                ),
              ),
              const Divider(
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
              const Divider(
                color: Colors.black,
              ),
              Expanded(
                child: Consumer<DepensesProv>(
                  builder: (context, depensesProv, child) {
                    return Container(
                      child: ListView.builder(
                        itemCount: depensesProv.AllDepenses.length,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.002),
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          child: Text(
                                            depensesProv
                                                .AllDepenses[index].User,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          alignment: Alignment.center,
                                          child: Text(
                                            depensesProv
                                                .AllDepenses[index].category,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${depensesProv.AllDepenses[index].date.substring(0, 10)}",
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            depensesProv
                                                .AllDepenses[index].montant,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          )))
                                ],
                              ));
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: DepenseNav(context),
              )
            ],
          ),
        ),
      )),
    );
  }
}
