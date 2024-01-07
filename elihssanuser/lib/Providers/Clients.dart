import 'package:elihssanuser/Objects/Allaboutclient.dart';
import 'package:elihssanuser/Objects/Clients.dart';
import 'package:elihssanuser/Services/Clients.dart';
import 'package:flutter/material.dart';

class ClientsProv extends ChangeNotifier {
  List<ClientObj> _Allclients = [];
  List<ClientObj> get Allclients => _Allclients;
  List<AllAboutClientObjet> _AllAboutClient = [];
  List<AllAboutClientObjet> get AllAboutClient => _AllAboutClient;
  Future<void> getAllclients(IdUser) async {
    _Allclients = await ClientsServ.getAllclientsOfUsr(IdUser);
    notifyListeners();
  }

  Future<void> getAllAboutClients(IdUser) async {
    _AllAboutClient = await ClientsServ.getAllAboutclients(IdUser);
    notifyListeners();
  }

  Future<void> updateClient(idclient, verss, context, IdUser) async {
    await ClientsServ.updateClient(idclient, verss, context);
    await getAllclients(IdUser);
    await getAllAboutClients(IdUser);
  }

  Future<void> AddCients(name, phone, map, magasin, region, remarques,
      dattesAnc, verss, IdUser) async {
    await ClientsServ.AddClient(
        name, phone, map, magasin, region, remarques, dattesAnc, verss, IdUser);
    await getAllclients(IdUser);
    await getAllAboutClients(IdUser);
  }
}
