import 'package:adfradio/controllers/radio_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonProperties {
  static const BIG_BUTTON = 100.0;
  static const LITTLE_BUTTON = 50.0;
  static const DEFAULT_COLOR = Color.fromRGBO(39, 39, 39, 0.4);

  final radius;
  final alignment;
  final iconColor;
  final buttonColor;

  ButtonProperties(
      {Key key,
      this.radius,
      this.alignment = Alignment.center,
      this.iconColor = Colors.white,
      this.buttonColor = DEFAULT_COLOR});

  double iconSize() => radius * 0.4;
}

class AnimatedButton extends StatelessWidget {

  final controller;
  final ButtonProperties buttonProperties;

  AnimatedButton({
    Key key,
    this.controller,
    this.buttonProperties
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: buildButton(buttonProperties.radius, buttonProperties.alignment, controller.buttonController(buttonProperties)),
        style: circleButtonStyle(buttonProperties.buttonColor),
        onPressed: controller.onPressed,
    );
  }
}

setController(buttonProperties, controller) => GetBuilder<RadioController>(
    init: controller,
    builder: (_controller) =>
        Icon(_controller.icon, size: buttonProperties.iconSize(), color: buttonProperties.iconColor));

BoxDecoration boxDecoration() => const BoxDecoration(shape: BoxShape.circle);

ButtonStyle circleButtonStyle(buttonColor) {
  return ElevatedButton.styleFrom(
      shape: const CircleBorder(), primary: buttonColor);
}

Container buildButton(radius, alignment, child) {
  return Container(
      width: radius,
      height: radius,
      alignment: alignment,
      decoration: boxDecoration(),
      child: child);
}
