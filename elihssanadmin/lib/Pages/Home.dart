// ignore_for_file: prefer_const_constructors
import 'package:elihssanadmin/Helpers/initialisations.dart';
import 'package:elihssanadmin/Pages/AchatPage.dart';
import 'package:elihssanadmin/Pages/Articles.dart';
import 'package:elihssanadmin/Pages/Benefice.dart';
import 'package:elihssanadmin/Pages/Catalogue.dart';
import 'package:elihssanadmin/Pages/Clinet.dart';
import 'package:elihssanadmin/Pages/Depenses.dart';
import 'package:elihssanadmin/Pages/Employes.dart';
import 'package:elihssanadmin/Pages/Fournisseur_Page.dart';
import 'package:elihssanadmin/Pages/Inventaire.dart';
import 'package:elihssanadmin/Pages/Stock.dart';
import 'package:elihssanadmin/Pages/VentVers.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.98),
        appBar: AppBar(
          backgroundColor: Colors.pink.withOpacity(0.6),
          toolbarHeight: 60,
          title: ListTile(
            title: Text(
              "El-ihssan",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/logo.jpg"),
            )
          ],
        ),
        body: LiquidPullToRefresh(
          showChildOpacityTransition: false,
          color: Colors.pink.withOpacity(0.6),
          height: MediaQuery.of(context).size.height * 0.3,
          onRefresh: () async {
            return await Future.delayed(Duration(seconds: 2), () {
              Initialisation.refresh(context);
            });
          },
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                  vertical: MediaQuery.of(context).size.height * 0.05),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: MediaQuery.of(context).size.width * 0.05,
                  mainAxisExtent: MediaQuery.of(context).size.height * 0.16,
                  mainAxisSpacing: MediaQuery.of(context).size.height * 0.025,
                  crossAxisCount: 2,
                ),
                children: [
                  CardButton(
                    imagepath: "images/catalogue_4677389.png",
                    label: "Catalogue",
                    ontap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Catalogue(),
                          ))
                    },
                  ),
                  CardButton(
                      imagepath: "images/add-cart_4570072.png",
                      label: "Vents et Verssement",
                      ontap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VentVers(),
                                ))
                          }),
                  CardButton(
                    imagepath: "images/Supplier.png",
                    label: "Fournisseurs",
                    ontap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Fournisseur(),
                          ))
                    },
                  ),
                  CardButton(
                      imagepath: "images/people_3239045.png",
                      label: "Clients",
                      ontap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CLient(),
                                ))
                          }),
                  CardButton(
                      imagepath: "images/depensespng.png",
                      label: "Depenses",
                      ontap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Depenses(),
                                ))
                          }),
                  CardButton(
                    imagepath: "images/Profit.png",
                    label: "Benefices",
                    ontap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Benefice(),
                          ))
                    },
                  ),
                  CardButton(
                    imagepath: "images/employee_912318.png",
                    label: "Employees",
                    ontap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Employees(),
                          ))
                    },
                  ),
                  CardButton(
                      imagepath: "images/Warehouse (1).png",
                      label: "Stock",
                      ontap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => StockPage(),
                                ))
                          }),
                  CardButton(
                      imagepath: "images/Product.png",
                      label: "Inventaire",
                      ontap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Inventaire(),
                                ))
                          }),
                  CardButton(
                      imagepath:
                          "images/pngtree_newspaper_icon_for_your_project_png_image_1520486.jpg",
                      label: "Article proposés",
                      ontap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Article(),
                                ))
                          }),
                  CardButton(
                    imagepath: "images/Shopping Cart.png",
                    label: "Achat",
                    ontap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AchatPage(),
                          ))
                    },
                  ),
                ],
              )),
        ),
      )),
    );
  }
}

class CardButton extends StatelessWidget {
  String imagepath;
  String label;
  var ontap;

  CardButton(
      {required this.imagepath, required this.label, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(blurRadius: 2.5, spreadRadius: 0.5, color: Colors.white)
            ]),
        child: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imagepath,
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Text(label)
            ],
          ),
        ),
      ),
    );
  }
}
