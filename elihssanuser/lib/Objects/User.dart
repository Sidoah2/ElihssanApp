import 'package:elihssanuser/Objects/Bons.dart';
import 'package:elihssanuser/Objects/Clients.dart';
import 'package:elihssanuser/Objects/Congees.dart';
import 'package:elihssanuser/Objects/Depense.dart';

class UserObj {
  String name, lieu, daterec, salairej, id, grade;
  List<CongeesObj> congees;
  List<BonsObj> bons;
  List<DepenseObj> depenses;
  List<ClientObj> clients;
  UserObj(
      {required this.name,
      required this.bons,
      required this.congees,
      required this.id,
      required this.daterec,
      required this.grade,
      required this.salairej,
      required this.lieu,
      required this.depenses,
      required this.clients});
}
