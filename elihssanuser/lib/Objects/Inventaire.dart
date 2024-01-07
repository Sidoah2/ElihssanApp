class InventaireObj {
  var id;
  bool isupdated;
  String name, category, PrixAchat, prixuni, ZoneStockage, Fournisseur, image;
  int cntt;
  InventaireObj(
      {required this.cntt,
      required this.name,
      required this.isupdated,
      required this.PrixAchat,
      required this.prixuni,
      required this.ZoneStockage,
      required this.Fournisseur,
      required this.category,
      required this.image,
      required this.id});
}
