import 'package:elihssanuser/Components/Widgets/ContenuOfbonDesign.dart';
import 'package:elihssanuser/Objects/Bons.dart';
import 'package:elihssanuser/Objects/Clients.dart';
import 'package:flutter/material.dart';

class ContenuOfBon extends StatelessWidget {
  ClientObj Client;
  String NBDV;
  BonsObj bon;
  ContenuOfBon({required this.Client, required this.NBDV, required this.bon});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
              body: ContenuOfbonDesign(
        Client: Client.name,
        NBDV: NBDV,
        cntx: context,
        bon: bon,
      ))),
    );
  }
}
