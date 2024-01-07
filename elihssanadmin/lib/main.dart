import 'dart:async';

import 'package:elihssanadmin/Pages/Home.dart';
import 'package:elihssanadmin/Providers/ArticlePropoProv.dart';
import 'package:elihssanadmin/Providers/BonLivraison.dart';
import 'package:elihssanadmin/Providers/BonVlientProv.dart';
import 'package:elihssanadmin/Providers/Bons.dart';
import 'package:elihssanadmin/Providers/Clients.dart';
import 'package:elihssanadmin/Providers/Congges.dart';
import 'package:elihssanadmin/Providers/Depenses.dart';
import 'package:elihssanadmin/Providers/Fournisseur.dart';
import 'package:elihssanadmin/Providers/Inventaire.dart';
import 'package:elihssanadmin/Providers/Produits.dart';
import 'package:elihssanadmin/Providers/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ClientsProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProduitsProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => FournisseursProv(),
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
          create: (context) => CongeesProv(),
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
    Provider.of<UserProv>(context, listen: false).getadmin();

    Provider.of<ProduitsProv>(context, listen: false).getAllproduit();
    Provider.of<ArticlePropoProv>(context, listen: false).getAllArticles();

    Provider.of<DepensesProv>(context, listen: false).getAlldepenses();
    Provider.of<InventaireProv>(context, listen: false).getAllproduit("admin");
    Provider.of<InventaireProv>(context, listen: false)
        .getAllproduitOfInventaires(context);

    // Provider.of<BonsProv>(context, listen: false).getAll();
    // Provider.of<DepensesProv>(context, listen: false).getAlldepenses();
    // Provider.of<UserProv>(context, listen: false).getAllaboutUsers();
    Provider.of<UserProv>(context, listen: false).getAllaboutUsers();
    Provider.of<UserProv>(context, listen: false).getAllEmpl();

    Provider.of<ClientsProv>(context, listen: false).getAllclients();
    Provider.of<ClientsProv>(context, listen: false).getAllAboutClients();
    Provider.of<FournisseursProv>(context, listen: false).getAllfournisseurs();
    Provider.of<FournisseursProv>(context, listen: false)
        .getAllAboutfournisseurs();
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
