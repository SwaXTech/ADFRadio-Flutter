import 'package:flutter/material.dart';

BoxDecoration buildBackground() {
  return BoxDecoration(
      gradient: LinearGradient(
          colors: [Color.fromRGBO(5, 5, 5, 1), Color.fromRGBO(45, 47, 60, 1)],
          stops: [0.2, 0.9],
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter)
  );
}