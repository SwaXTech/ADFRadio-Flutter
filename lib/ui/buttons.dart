import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adfradio/model/button_properties.dart';

class ButtonWithController extends StatelessWidget {

  final controller;
  final ButtonProperties buttonProperties;

  ButtonWithController({
    Key key,
    this.controller,
    this.buttonProperties
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: _ButtonContainer(radius: buttonProperties.radius, alignment: buttonProperties.alignment, child: controller.buttonController(buttonProperties)),
        style: circleButtonStyle(buttonProperties.buttonColor),
        onPressed: controller.onPressed,
    );
  }

  ButtonStyle circleButtonStyle(buttonColor) {
    return ElevatedButton.styleFrom(
        shape: const CircleBorder(), primary: buttonColor);
  }
}

class _ButtonContainer extends StatelessWidget {

  final radius;
  final alignment;
  final child;

  const _ButtonContainer({
    Key key,
    this.radius,
    this.alignment,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: radius,
        height: radius,
        alignment: alignment,
        decoration: boxDecoration(),
        child: child);
  }

  BoxDecoration boxDecoration() => const BoxDecoration(shape: BoxShape.circle);
}


