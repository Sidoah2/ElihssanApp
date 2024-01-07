import 'package:elihssanadmin/Components/ButtomNav/CongeeNav.dart';
import 'package:elihssanadmin/Objects/User.dart';
import 'package:elihssanadmin/Providers/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Conges extends StatelessWidget {
  UserObj user;
  Conges(this.user);
  List<String> Titres = ["Date de depart", "Date d'arrivee"];

  @override
  Widget build(BuildContext contextg) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: Scaffold(
        body: Consumer<UserProv>(
          builder: (context, userProv, child) {
            return Container(
              child: Column(
                children: [
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    children: Titres.map((e) => Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Text(
                            "$e",
                            textAlign: TextAlign.center,
                          ),
                        ))).toList(),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Expanded(
                      child: Container(
                    child: ListView.builder(
                      itemCount: user.congees.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "${user.congees[index].depart}")),
                            Expanded(
                                child: Text(
                                    textAlign: TextAlign.center,
                                    "${user.congees[index].arrivee}")),
                          ],
                        );
                      },
                    ),
                  )),
                  Container(
                    child: CongeeNav(contextg, user),
                  )
                ],
              ),
            );
          },
        ),
      )),
    );
  }
}
