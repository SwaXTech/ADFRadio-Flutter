import 'dart:ui';
import 'package:flutter/material.dart';

class ButtonProperties {
  static const BIG_BUTTON = 100.0;
  static const LITTLE_BUTTON = 50.0;
  static const DEFAULT_COLOR = const Color.fromRGBO(39, 39, 39, 0.4);

  final radius;
  final alignment;
  final iconColor;
  final buttonColor;

  const ButtonProperties(
      {Key key,
        this.radius,
        this.alignment = Alignment.center,
        this.iconColor = Colors.white,
        this.buttonColor = DEFAULT_COLOR});

  double iconSize() => radius * 0.4;
}