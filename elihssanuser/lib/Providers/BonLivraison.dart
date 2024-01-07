import 'package:elihssanuser/Objects/Bon.dart';
import 'package:elihssanuser/Objects/ItemInBon.dart';
import 'package:flutter/material.dart';

class BonLivraisonProv extends ChangeNotifier {
  List<ItemInbonObj> _AllProduitsSlected = [];
  List<ItemInbonObj> get AllProduitsSlected => _AllProduitsSlected;
  BonobjForADD _bon = BonobjForADD(
      oldverss: "",
      Designation: "",
      IdClient: "",
      IdUser: "",
      NBDV: "",
      Quntity: "",
      Prixtotalbon: "",
      IdsProduit: "",
      OldQuntity: "",
      Prixuni: "",
      verssement: "0");
  BonobjForADD get bon => _bon;
}
