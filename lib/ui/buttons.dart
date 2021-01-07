import 'package:adfradio/controllers/button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Button extends StatelessWidget {
  final id;
  final radius;
  final controller;
  final iconColor;
  final buttonColor;
  final alignment;
  final iconSize;

  Button({
    Key key,
    this.id,
    this.radius,
    this.iconSize,
    this.controller,
    this.iconColor = Colors.white,
    this.buttonColor = const Color.fromRGBO(39, 39, 39, 0.4),
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtonController>(
      init: controller,
      builder: (_controller) => ElevatedButton(
        child: buildButton(),
        style: circleButtonStyle(buttonColor),
        onPressed: _controller.onPressed,
      ),
    );
  }

  Container buildButton() {
    return Container(
        width: radius,
        height: radius,
        alignment: alignment,
        decoration: boxDecoration(),
        child: setController());
  }

  GetBuilder<ButtonController> setController() => GetBuilder(
      id: id,
      builder: (_controller) =>
          Icon(_controller.icon, size: iconSize, color: iconColor));
}

BoxDecoration boxDecoration() => const BoxDecoration(shape: BoxShape.circle);

ButtonStyle circleButtonStyle(buttonColor) {
  return ElevatedButton.styleFrom(
      shape: const CircleBorder(), primary: buttonColor);
}
