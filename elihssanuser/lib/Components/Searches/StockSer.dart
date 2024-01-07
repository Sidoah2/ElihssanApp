import 'package:elihssanuser/Objects/produit.dart';
import 'package:elihssanuser/Providers/Produits.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StockSer extends StatefulWidget {
  @override
  State<StockSer> createState() => _designsearchState();
}

class _designsearchState extends State<StockSer> {
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
    List<ProduitObj> allproducts =
        Provider.of<ProduitsProv>(context, listen: false).Allproduits;
    late ProduitObj product;
    try {
      product = allproducts.firstWhere((element) => element.id == id);
      // allproducts.firstWhere((element) => element.id.toString() == id);
    } catch (e) {}

    return showres(product, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProduitObj> allproducts =
        Provider.of<ProduitsProv>(context, listen: false).Allproduits;
    List<ProduitObj> filterProducts =
        allproducts.where((element) => element.name.contains(query)).toList();

    return Container(
      color: Colors.grey.shade300,
      child: ListView.builder(
        itemCount: query == "" ? allproducts.length : filterProducts.length,
        itemBuilder: (context, index) {
          return query == ""
              ? showsgg(context, allproducts[index])
              : showsgg(context, filterProducts[index]);
        },
      ),
    );
  }

  showsgg(context, ProduitObj Product) {
    DateTime dateTime;
    var cmp;
    if (Product.dateExp != "") {
      dateTime = DateTime(
          int.parse(Product.dateExp.substring(6, 10)),
          int.parse(Product.dateExp.substring(3, 5)),
          int.parse(Product.dateExp.substring(0, 2)));
      cmp = DateTime.now().compareTo(dateTime);
    } else {
      dateTime = DateTime(0);
    }
    return InkWell(
      onTap: () {
        if (query == "") {
          query = Product.name;
          id = Product.id.toString();
        } else {
          query = Product.name;
          id = Product.id.toString();
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
                child:
                    Text(textAlign: TextAlign.center, "${Product.category}")),
            Expanded(
                child: Text(textAlign: TextAlign.center, "${Product.name}")),
            Expanded(
                child: Text(textAlign: TextAlign.center, "${Product.cntt}")),
            Expanded(
                child: dateTime.year != 0
                    ? cmp == -1
                        ? Text(
                            textAlign: TextAlign.center,
                            "${dateTime.year}/${dateTime.month}/${dateTime.day}",
                            style: TextStyle(color: Colors.green),
                          )
                        : Text(
                            textAlign: TextAlign.center,
                            "${dateTime.year}/${dateTime.month}/${dateTime.day}",
                            style: TextStyle(color: Colors.red))
                    : Text(
                        textAlign: TextAlign.center,
                        "/",
                      )),
          ]),
        ),
      ),
    );
  }

  showres(ProduitObj Product, context) {
    List<String> Titres = [
      "Category",
      "Produit",
      "Quntity en stock",
      "Date d'Exp",
    ];
    DateTime dateTime;
    var cmp;
    if (Product.dateExp != "") {
      dateTime = DateTime(
          int.parse(Product.dateExp.substring(6, 10)),
          int.parse(Product.dateExp.substring(3, 5)),
          int.parse(Product.dateExp.substring(0, 2)));
      cmp = DateTime.now().compareTo(dateTime);
    } else {
      dateTime = DateTime(0);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
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
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(children: [
              Expanded(
                  child:
                      Text(textAlign: TextAlign.center, "${Product.category}")),
              Expanded(
                  child: Text(textAlign: TextAlign.center, "${Product.name}")),
              Expanded(
                  child: Text(textAlign: TextAlign.center, "${Product.cntt}")),
              Expanded(
                child: dateTime.year != 0
                    ? cmp == -1
                        ? Text(
                            textAlign: TextAlign.center,
                            "${dateTime.year}/${dateTime.month}/${dateTime.day}",
                            style: TextStyle(color: Colors.green),
                          )
                        : Text(
                            textAlign: TextAlign.center,
                            "${dateTime.year}/${dateTime.month}/${dateTime.day}",
                            style: TextStyle(color: Colors.red))
                    : Text(textAlign: TextAlign.center, "/"),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
