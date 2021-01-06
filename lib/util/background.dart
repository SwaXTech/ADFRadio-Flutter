import 'package:flutter/material.dart';

BoxDecoration buildBackground() {
  return BoxDecoration(
      gradient: LinearGradient(
          colors: [Colors.black, Color.fromRGBO(66, 71, 89, 1)],
          stops: [0.2, 0.9],
          begin: FractionalOffset.bottomRight,
          end: FractionalOffset.topLeft)
  );
}