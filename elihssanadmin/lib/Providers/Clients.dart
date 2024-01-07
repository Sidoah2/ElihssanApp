import 'package:elihssanadmin/Objects/Allaboutclient.dart';
import 'package:elihssanadmin/Objects/Clients.dart';
import 'package:elihssanadmin/Services/Clients.dart';
import 'package:flutter/material.dart';

class ClientsProv extends ChangeNotifier {
  List<ClientObj> _Allclients = [];
  List<ClientObj> get Allclients => _Allclients;
  List<AllAboutClientObjet> _AllAboutClient = [];
  List<AllAboutClientObjet> get AllAboutClient => _AllAboutClient;
  Future<void> getAllclients() async {
    _Allclients = await ClientsServ.getAllclients();
    notifyListeners();
  }

  Future<void> getAllAboutClients() async {
    _AllAboutClient = await ClientsServ.getAllAboutclients();
    notifyListeners();
  }

  Future<void> updateClient(idclient, verss, context) async {
    await ClientsServ.updateClient(idclient, verss, context);
    await getAllclients();
    await getAllAboutClients();
  }

  Future<void> AddCients(name, phone, map, magasin, region, remarques,
      dattesAnc, verss, User) async {
    await ClientsServ.AddClient(
        name, phone, map, magasin, region, remarques, dattesAnc, verss, User);
    await getAllclients();
    await getAllAboutClients();
  }
}
