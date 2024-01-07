import 'package:elihssanuser/Objects/produit.dart';
import 'package:flutter/material.dart';

class BonClientProv extends ChangeNotifier {
  var yearNow = DateTime.now().year;
  var seconds = DateTime.now().microsecond;
  int _verssement = 0;
  int get verssement => _verssement;
  set verssement(val) {
    _verssement = val;
  }

  var _idClient;
  var _ClientName;
  get ClientName => _ClientName;
  get idClient => _idClient;
  List<ProduitObj> _produits = [];
  List<int> _cntt = [];
  List<ProduitObj> get produits => _produits;
  set produits(Newproduit) {
    _produits = Newproduit;
  }

  set ClientName(ClientName) {
    _ClientName = ClientName;
  }

  List<int> get cntt => _cntt;
  set cntt(Newcntt) {
    _cntt = Newcntt;
  }

  set idClient(id) {
    _idClient = id;
  }
}
