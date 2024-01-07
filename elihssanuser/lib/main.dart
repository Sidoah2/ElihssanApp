import 'dart:async';
import 'dart:io';

import 'package:elihssanuser/Pages/Home.dart';
import 'package:elihssanuser/Providers/ArticlePropoProv.dart';
import 'package:elihssanuser/Providers/BonLivraison.dart';
import 'package:elihssanuser/Providers/BonVlientProv.dart';
import 'package:elihssanuser/Providers/Bons.dart';
import 'package:elihssanuser/Providers/Clients.dart';
import 'package:elihssanuser/Providers/Depenses.dart';
import 'package:elihssanuser/Providers/Inventaire.dart';
import 'package:elihssanuser/Providers/Localdb.dart';
import 'package:elihssanuser/Providers/Produits.dart';
import 'package:elihssanuser/Providers/User.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDocdir = await getApplicationDocumentsDirectory();
  String appdocpath = await appDocdir.path;
  Hive.init(appdocpath);
  await Hive.openBox("LocalDB");
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ClientsProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProduitsProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => BonsProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => DepensesProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => BonClientProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => ArticlePropoProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => BonLivraisonProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => InventaireProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocaldbProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => InventaireProv(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen())));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var idUser;
    final LocalDB = Hive.box("LocalDB");
    if (LocalDB.values.toList().length != 0) {
      List values = LocalDB.values.toList();
      idUser = values[0];
    }
    Provider.of<LocaldbProv>(context, listen: false).getUser();

    Provider.of<ProduitsProv>(context, listen: false).getAllproduit();
    Provider.of<ArticlePropoProv>(context, listen: false)
        .getAllArticles(idUser);
    Provider.of<DepensesProv>(context, listen: false).getAlldepenses(idUser);
    Provider.of<InventaireProv>(context, listen: false).getAllproduit(idUser);
    Provider.of<ClientsProv>(context, listen: false).getAllclients(idUser);
    Provider.of<ClientsProv>(context, listen: false).getAllAboutClients(idUser);
  }

  @override
  Widget build(BuildContext contextg) {
    Timer(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          contextg,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
          (route) => false);
    });
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pink, Colors.white, Colors.pink],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Image.asset("images/logo.jpg"))),
          ),
        ),
      ),
    );
  }
}
