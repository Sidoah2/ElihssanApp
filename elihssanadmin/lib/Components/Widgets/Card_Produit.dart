// ignore_for_file: sort_child_properties_last

import 'dart:convert';

import 'package:elihssanadmin/Objects/ItemInBon.dart';
import 'package:elihssanadmin/Objects/produit.dart';
import 'package:elihssanadmin/Providers/BonLivraison.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardProduit extends StatelessWidget {
  ProduitObj produitObjet;
  CardProduit({required this.produitObjet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.pink),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                color: Colors.white,
                blurRadius: 2,
                offset: Offset(1, 0),
                spreadRadius: 2)
          ]),
      child: Column(
        children: [
          const Row(
            children: [],
          ),
          InteractiveViewer(
            maxScale: 10,
            minScale: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.memory(
                base64Decode(produitObjet.image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * 0.004),
            child: const Divider(
              color: Colors.pink,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nom de produit :",
                      style: FirstStyle(),
                    ),
                    Text(
                      "${produitObjet.name}",
                      style: SecondStyle(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Prix Uni SubGros :",
                      style: FirstStyle(),
                    ),
                    Text(
                      "${produitObjet.prixunisubgros} dz",
                      style: SecondStyle(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Prix Uni Gros:",
                      style: FirstStyle(),
                    ),
                    Text(
                      "${produitObjet.prixunigros} dz",
                      style: SecondStyle(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity en stock :",
                      style: FirstStyle(),
                    ),
                    Text(
                      "${produitObjet.cntt}",
                      style: SecondStyle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Consumer<BonLivraisonProv>(
            builder: (context, bonLivraisonProv, child) {
              ItemInbonObj tst;
              String prixUni;
              ItemInbonObj item = ItemInbonObj(
                  Designation: "",
                  Prixuni: "",
                  Quntity: "",
                  Oldcntt: "",
                  ids: "");
              return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01,
                      horizontal: MediaQuery.of(context).size.width * 0.2),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            title: Text("Select Prix Uni"),
                            content: Wrap(
                              direction: Axis.vertical,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    prixUni = produitObjet.prixunigros;
                                    item.Prixuni = prixUni;
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(produitObjet.prixunigros),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    Navigator.pop(context);
                                    prixUni = produitObjet.prixunisubgros;
                                    item.Prixuni = prixUni;
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(produitObjet.prixunisubgros),
                                  ),
                                ),
                              ],
                            )),
                      );

                      if (bonLivraisonProv.AllProduitsSlected.length == 0) {
                        item.Designation = produitObjet.name;
                        item.ids = produitObjet.id;
                        item.Oldcntt = (produitObjet.cntt).toString();
                        item.Quntity = "1";
                        bonLivraisonProv.AllProduitsSlected.add(item);
                      } else {
                        tst = bonLivraisonProv.AllProduitsSlected.firstWhere(
                            (produit) =>
                                produit.Designation == produitObjet.name,
                            orElse: () => ItemInbonObj(
                                ids: "",
                                Oldcntt: "",
                                Designation: "",
                                Prixuni: "",
                                Quntity: ""));
                        if (tst.Designation == "") {
                          item.Designation = produitObjet.name;
                          item.Quntity = "1";
                          item.ids = produitObjet.id;
                          item.Oldcntt = (produitObjet.cntt).toString();
                          bonLivraisonProv.AllProduitsSlected.add(item);
                        }
                      }
                    },
                    child: Container(
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.pink,
                            Colors.white,
                          ], transform: GradientRotation(-1)),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ));
            },
          )
        ],
      ),
    );
  }

  TextStyle FirstStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle SecondStyle() {
    return const TextStyle(
      color: Colors.black87,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
  }
}
