class ProduitObj {
  var id;
  String name,
      image,
      category,
      dateExp,
      dateAchat,
      PrixAchat,
      ZoneStockage,
      Fournisseur,
      prixunigros,
      prixunisubgros;
  int cntt, verss;
  ProduitObj(
      {required this.cntt,
      required this.name,
      required this.verss,
      required this.PrixAchat,
      required this.ZoneStockage,
      required this.dateAchat,
      required this.Fournisseur,
      required this.dateExp,
      required this.category,
      required this.prixunigros,
      required this.prixunisubgros,
      required this.image,
      required this.id});
}
