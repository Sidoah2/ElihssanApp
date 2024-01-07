import 'package:elihssanuser/Objects/User.dart';
import 'package:elihssanuser/Providers/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeesSer extends StatefulWidget {
  @override
  State<EmployeesSer> createState() => _designsearchState();
}

class _designsearchState extends State<EmployeesSer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          showSearch(context: context, delegate: BuidSearchDelegate());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(child: Text("Search ...")),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 30,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class BuidSearchDelegate extends SearchDelegate {
  String name = "";
  var cnttcntrl = TextEditingController();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<UserObj> allempl =
        Provider.of<UserProv>(context, listen: false).AllaboutEmpl;
    late UserObj empl;
    try {
      empl = allempl.firstWhere((element) => element.name == query);
      // allproducts.firstWhere((element) => element.id.toString() == id);
    } catch (e) {}

    return showres(empl, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<UserObj> allempl =
        Provider.of<UserProv>(context, listen: false).AllaboutEmpl;
    List<UserObj> filterEmpl =
        allempl.where((element) => element.name.contains(query)).toList();

    return Container(
      color: Colors.grey.shade300,
      child: ListView.builder(
        itemCount: query == "" ? allempl.length : filterEmpl.length,
        itemBuilder: (context, index) {
          return query == ""
              ? showsgg(context, allempl[index])
              : showsgg(context, filterEmpl[index]);
        },
      ),
    );
  }

  showsgg(context, UserObj empl) {
    int PrixTotalDedepense = 0;
    for (var depense in empl.depenses) {
      PrixTotalDedepense = PrixTotalDedepense + int.parse(depense.montant);
    }

    return InkWell(
      onTap: () {
        if (query == "") {
          query = empl.name;
        } else {
          query = empl.name;
        }
        showResults(context);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.13,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(children: [
            Expanded(child: Text(textAlign: TextAlign.center, "${empl.name}")),
            Expanded(child: Text(textAlign: TextAlign.center, "${empl.lieu}")),
            Expanded(
              child: Text(textAlign: TextAlign.center, "${empl.daterec}"),
            ),
            Expanded(
                child: Text(textAlign: TextAlign.center, "${empl.salairej}")),
            Expanded(
                child:
                    Text(textAlign: TextAlign.center, "${PrixTotalDedepense}")),
          ]),
        ),
      ),
    );
  }

  showres(UserObj empl, context) {
    int PrixTotalDedepense = 0;
    for (var depense in empl.depenses) {
      PrixTotalDedepense = PrixTotalDedepense + int.parse(depense.montant);
    }
    List<String> Titres = [
      "Name",
      "lieu de travail",
      "Date de recrutement",
      "Salaire journalier",
      "Montant Totales Des Depenses",
      "Jours de Conge",
      "Jours de travail",
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Divider(),
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
          Divider(),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(children: [
              Expanded(
                  child: Text(textAlign: TextAlign.center, "${empl.name}")),
              Expanded(
                  child: Text(textAlign: TextAlign.center, "${empl.lieu}")),
              Expanded(
                child: Text(textAlign: TextAlign.center, "${empl.daterec}"),
              ),
              Expanded(
                  child: Text(textAlign: TextAlign.center, "${empl.salairej}")),
              Expanded(
                  child:
                      Text(textAlign: TextAlign.center, "$PrixTotalDedepense")),
            ]),
          ),
        ],
      ),
    );
  }
}
