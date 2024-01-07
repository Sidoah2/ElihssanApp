import 'package:flutter/material.dart';

class BotommNaave extends StatelessWidget {
  final IconData? icon;
  final void Function()? ontap;
  BotommNaave(this.ontap, this.icon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Icon(
          icon,
          color: Colors.white,
          size: 26,
        ));
  }
}
