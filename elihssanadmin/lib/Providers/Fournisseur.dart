import 'package:elihssanadmin/Objects/Allaboutfournisseur.dart';
import 'package:elihssanadmin/Objects/Fournisseur.dart';
import 'package:elihssanadmin/Services/Fournisseur.dart';
import 'package:flutter/material.dart';

class FournisseursProv extends ChangeNotifier {
  List<FournisseurObj> _AllFournisseur = [];
  List<FournisseurObj> get AllFournisseur => _AllFournisseur;
  List<AllAboutFournisseurObj> _AllAboutFournisseur = [];
  List<AllAboutFournisseurObj> get AllAboutFournisseur => _AllAboutFournisseur;
  Future<void> getAllfournisseurs() async {
    _AllFournisseur = await FournisseursSer.getAllfournisseurs();
    notifyListeners();
  }

  Future<void> updateverss(idfournisseur, verss, context) async {
    await FournisseursSer.updateverss(idfournisseur, verss, context);
    await getAllfournisseurs();
  }

  Future<void> getAllAboutfournisseurs() async {
    _AllAboutFournisseur = await FournisseursSer.getAllAboutfournisseurs();
    notifyListeners();
  }

  Future<void> Addfournisseur(name, phone, adressfournisseur, adressmap, region,
      remarques, dattesAnc, context) async {
    await FournisseursSer.postfournisseue(name, phone, adressfournisseur,
        adressmap, region, remarques, dattesAnc, context);

    await getAllfournisseurs();
  }

  // Future<void> deleteclient(idclient) async {
  //   await ClinetsServ.deleteclient(idclient);

  //   await getAllfournisseurs();
  // }
}
