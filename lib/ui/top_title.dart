import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {

  static const title = "ADF Radio";
  static const subtitle = "Asambela de Dios Flores";

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          Text(subtitle, style: TextStyle(color: Colors.white, fontSize: 15), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}