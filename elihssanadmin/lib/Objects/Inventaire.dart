class InventaireObj {
  var id;
  bool isupdated;
  String name, category, PrixAchat, ZoneStockage, Fournisseur;
  int cntt;
  InventaireObj(
      {required this.cntt,
      required this.name,
      required this.isupdated,
      required this.PrixAchat,
      required this.ZoneStockage,
      required this.Fournisseur,
      required this.category,
      required this.id});
}
