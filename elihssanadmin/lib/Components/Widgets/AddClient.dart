import 'package:elihssanadmin/Pages/Clinet.dart';
import 'package:elihssanadmin/Providers/Clients.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddClient extends StatefulWidget {
  var cntx;
  AddClient({required this.cntx});

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  var namecntrl = TextEditingController();

  var phonecntrl = TextEditingController();

  var mapcntrl = TextEditingController();

  var magasincntrl = TextEditingController();

  var regioncntrl = TextEditingController();

  var remarquescntrl = TextEditingController();

  var dattescntrl = TextEditingController();

  List<String> Titres = [
    "Client Name",
    "Phone number",
    "Adress Map",
    "Adress Magasin",
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
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CLient(),
                    ),
                    (route) => false);
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
                    controller: magasincntrl,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: InkWell(
                    onTap: () async {
                      await Provider.of<ClientsProv>(context, listen: false)
                          .AddCients(
                              namecntrl.text,
                              phonecntrl.text,
                              mapcntrl.text,
                              magasincntrl.text,
                              regioncntrl.text,
                              remarquescntrl.text,
                              dattescntrl.text,
                              0,
                              "Admin");
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
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
