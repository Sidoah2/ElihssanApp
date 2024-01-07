import 'package:elihssanadmin/Components/Widgets/Design_Bon.dart';
import 'package:flutter/material.dart';

class BonLivraison extends StatelessWidget {
  String NBDV, ClientName;
  BonLivraison(this.ClientName, this.NBDV);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: Scaffold(body: DesignBon(ClientName, NBDV))),
    );
  }
}
