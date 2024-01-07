import 'package:elihssanuser/Components/ButtomNav/CatalogueNav.dart';
import 'package:elihssanuser/Components/Widgets/Card_Produit.dart';
import 'package:elihssanuser/Providers/Produits.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Catalogue extends StatelessWidget {
  const Catalogue({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        body: Container(
          child: Column(children: [
            Expanded(child: Consumer<ProduitsProv>(
              builder: (context, produitsProv, child) {
                return ListView.builder(
                  itemCount: produitsProv.Allproduits.length,
                  itemBuilder: (context, index) {
                    return CardProduit(
                        produitObjet: produitsProv.Allproduits[index]);
                  },
                );
              },
            )),
            Container(
              child: CatalogueNav(
                context,
              ),
            )
          ]),
        ),
      )),
    );
  }
}
