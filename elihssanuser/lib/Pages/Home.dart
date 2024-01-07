// ignore_for_file: prefer_const_constructors

import 'package:elihssanuser/Helpers/initialisations.dart';
import 'package:elihssanuser/Pages/Articles.dart';
import 'package:elihssanuser/Pages/Catalogue.dart';
import 'package:elihssanuser/Pages/Clinet.dart';
import 'package:elihssanuser/Pages/Depenses.dart';
import 'package:elihssanuser/Pages/Inventaire.dart';
import 'package:elihssanuser/Pages/Stock.dart';
import 'package:elihssanuser/Pages/VentVers.dart';
import 'package:elihssanuser/Providers/Localdb.dart';
import 'package:elihssanuser/Services/User.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var Usercntrl = TextEditingController();
    var lieucntrl = TextEditingController();

    if (Provider.of<LocaldbProv>(context, listen: false).User == "") {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          body: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("Enter Your Name")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: Usercntrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: lieucntrl,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: InkWell(
                        onTap: () {
                          Provider.of<LocaldbProv>(context, listen: false)
                              .postUser(Usercntrl.text)
                              .then((value) async {
                            USerServ.postuser(Usercntrl.text, lieucntrl.text);
                            if (Provider.of<LocaldbProv>(context, listen: false)
                                    .User !=
                                "") {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Home(),
                                  ),
                                  (route) => false);
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: Colors.blue.shade300,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
        )),
      );
    } else {
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
                                    builder: (context) => InvetairePage(),
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
                  ],
                )),
          ),
        )),
      );
    }
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
