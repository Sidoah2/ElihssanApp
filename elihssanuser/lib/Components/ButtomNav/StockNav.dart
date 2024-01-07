import 'package:flutter/material.dart';

import 'BottomNav.dart';

class StockNav extends StatefulWidget {
  var ctx;
  StockNav(this.ctx);
  @override
  State<StockNav> createState() => _ButtomIconsState();
}

class _ButtomIconsState extends State<StockNav> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.pink,
              Colors.white,
            ], transform: GradientRotation(-1)),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BotommNaave(() {
              Navigator.pop(widget.ctx);
            }, Icons.home),
          ],
        ),
      ),
    );
  }
}
