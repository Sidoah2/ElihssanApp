import 'package:elihssanuser/Providers/ArticlePropoProv.dart';
import 'package:elihssanuser/Providers/BonLivraison.dart';
import 'package:elihssanuser/Providers/Clients.dart';
import 'package:elihssanuser/Providers/Depenses.dart';
import 'package:elihssanuser/Providers/Inventaire.dart';
import 'package:elihssanuser/Providers/Localdb.dart';
import 'package:elihssanuser/Providers/Produits.dart';
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
    Provider.of<ArticlePropoProv>(context, listen: false)
        .getAllArticles(Provider.of<LocaldbProv>(context, listen: false).User);

    Provider.of<DepensesProv>(context, listen: false)
        .getAlldepenses(Provider.of<LocaldbProv>(context, listen: false).User);

    Provider.of<DepensesProv>(context, listen: false).Totaldepenses = 0;

    Provider.of<InventaireProv>(context, listen: false)
        .getAllproduit(Provider.of<LocaldbProv>(context, listen: false).User);

    Provider.of<ClientsProv>(context, listen: false)
        .getAllclients(Provider.of<LocaldbProv>(context, listen: false).User);
    Provider.of<ClientsProv>(context, listen: false).getAllAboutClients(
        Provider.of<LocaldbProv>(context, listen: false).User);
  }
}
