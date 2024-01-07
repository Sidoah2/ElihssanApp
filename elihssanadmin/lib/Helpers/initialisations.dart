import 'package:elihssanadmin/Providers/ArticlePropoProv.dart';
import 'package:elihssanadmin/Providers/BonLivraison.dart';
import 'package:elihssanadmin/Providers/Clients.dart';
import 'package:elihssanadmin/Providers/Depenses.dart';
import 'package:elihssanadmin/Providers/Fournisseur.dart';
import 'package:elihssanadmin/Providers/Inventaire.dart';
import 'package:elihssanadmin/Providers/Produits.dart';
import 'package:elihssanadmin/Providers/User.dart';
import 'package:provider/provider.dart';

class Initialisation {
  static IniBon(context) {
    Provider.of<BonLivraisonProv>(context, listen: false)
        .AllProduitsSlected
        .clear();
    Provider.of<BonLivraisonProv>(context, listen: false).bon.Designation = "";
    Provider.of<BonLivraisonProv>(context, listen: false).bon.IdClient = "";
    Provider.of<BonLivraisonProv>(context, listen: false).bon.IdsProduit = "";
    Provider.of<BonLivraisonProv>(context, listen: false).bon.NBDV = "";
    Provider.of<BonLivraisonProv>(context, listen: false).bon.OldQuntity = "";
    Provider.of<BonLivraisonProv>(context, listen: false).bon.Prixtotalbon = "";
    Provider.of<BonLivraisonProv>(context, listen: false).bon.Quntity = "";
    Provider.of<BonLivraisonProv>(context, listen: false).bon.Prixuni = "";
    Provider.of<BonLivraisonProv>(context, listen: false).bon.oldverss = "";
    Provider.of<BonLivraisonProv>(context, listen: false).bon.verssement = "";
  }

  static void refresh(context) {
    Provider.of<ProduitsProv>(context, listen: false).getAllproduit();
    Provider.of<ArticlePropoProv>(context, listen: false).getAllArticles();
    Provider.of<DepensesProv>(context, listen: false).getAlldepenses();
    Provider.of<InventaireProv>(context, listen: false).getAllproduit("admin");
    Provider.of<InventaireProv>(context, listen: false)
        .getAllproduitOfInventaires(context);
    Provider.of<UserProv>(context, listen: false).getAllaboutUsers();
    Provider.of<UserProv>(context, listen: false).getAllEmpl();

    Provider.of<ClientsProv>(context, listen: false).getAllclients();
    Provider.of<ClientsProv>(context, listen: false).getAllAboutClients();
    Provider.of<FournisseursProv>(context, listen: false).getAllfournisseurs();
    Provider.of<FournisseursProv>(context, listen: false)
        .getAllAboutfournisseurs();
  }
}
