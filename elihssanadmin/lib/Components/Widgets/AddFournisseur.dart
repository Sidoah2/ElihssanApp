import 'package:elihssanadmin/Providers/Fournisseur.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFournisseur extends StatefulWidget {
  AddFournisseur({super.key});

  @override
  State<AddFournisseur> createState() => _AddClientState();
}

class _AddClientState extends State<AddFournisseur> {
  var namecntrl = TextEditingController();

  var phonecntrl = TextEditingController();

  var mapcntrl = TextEditingController();

  var adressfourcntrl = TextEditingController();

  var regioncntrl = TextEditingController();

  var remarquescntrl = TextEditingController();

  var dattescntrl = TextEditingController();

  List<String> Titres = [
    "Fournisseur Name",
    "Phone number",
    "Adress Map",
    "Adress Fournisseur",
    "region",
    "Remarques",
    "Dattes anciennes"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
          child: Container(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    controller: namecntrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      label: Text(Titres[0]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: phonecntrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      label: Text(Titres[1]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    controller: mapcntrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      label: Text(Titres[2]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    controller: adressfourcntrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      label: Text(Titres[3]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    controller: regioncntrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      label: Text(Titres[4]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    controller: remarquescntrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      label: Text(Titres[5]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: dattescntrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      label: Text(Titres[6]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: InkWell(
                    onTap: () async {
                      await Provider.of<FournisseursProv>(context,
                              listen: false)
                          .Addfournisseur(
                              namecntrl.text,
                              phonecntrl.text,
                              adressfourcntrl.text,
                              mapcntrl.text,
                              regioncntrl.text,
                              remarquescntrl.text,
                              dattescntrl.text,
                              context);
                    },
                    child: Container(
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.pink,
                            Colors.white,
                          ], transform: GradientRotation(-1)),
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
