import 'package:elihssanadmin/Objects/Depense.dart';
import 'package:elihssanadmin/Providers/Depenses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepenseSearch extends StatefulWidget {
  @override
  State<DepenseSearch> createState() => _designsearchState();
}

class _designsearchState extends State<DepenseSearch> {
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
  String id = "";
  int aaa = 1;

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
    List<DepenseObj> alldepenses =
        Provider.of<DepensesProv>(context, listen: false).AllDepenses;
    late DepenseObj depense;
    try {
      depense = alldepenses.firstWhere((element) => element.id == id);
      // allproducts.firstWhere((element) => element.id.toString() == id);
    } catch (e) {}

    return showres(depense, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<DepenseObj> AllDepenses =
        Provider.of<DepensesProv>(context, listen: false).AllDepenses;
    List<DepenseObj> filterProducts =
        AllDepenses.where((element) => element.User.contains(query)).toList();

    return Container(
      color: Colors.grey.shade300,
      child: ListView.builder(
        itemCount: query == "" ? AllDepenses.length : filterProducts.length,
        itemBuilder: (context, index) {
          return query == ""
              ? showsgg(context, AllDepenses[index])
              : showsgg(context, filterProducts[index]);
        },
      ),
    );
  }

  showsgg(context, DepenseObj depense) {
    return InkWell(
      onTap: () {
        if (query == "") {
          query = depense.User;
          id = depense.id.toString();
        } else {
          query = depense.User;
          id = depense.id.toString();
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
            Expanded(
                child: Text(textAlign: TextAlign.center, "${depense.User}")),
            Expanded(
              child: Text(textAlign: TextAlign.center, "${depense.category}"),
            ),
            Expanded(
                child: Text(textAlign: TextAlign.center, "${depense.date}")),
            Expanded(
                child: Text(textAlign: TextAlign.center, "${depense.montant}")),
          ]),
        ),
      ),
    );
  }

  showres(DepenseObj depense, context) {
    List<String> Titres = ["User", "Category", "Date", "Montant"];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
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
            Row(children: [
              Expanded(
                child: Text(textAlign: TextAlign.center, "${depense.User}"),
              ),
              Expanded(
                  child:
                      Text(textAlign: TextAlign.center, "${depense.category}")),
              Expanded(
                  child: Text(textAlign: TextAlign.center, "${depense.date}")),
              Expanded(
                  child:
                      Text(textAlign: TextAlign.center, "${depense.montant}")),
            ]),
          ],
        ),
      ),
    );
  }
}
