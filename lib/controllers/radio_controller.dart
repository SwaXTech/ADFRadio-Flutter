import 'package:adfradio/controllers/button_controller.dart';
import 'package:adfradio/platform_api/radio_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioController extends GetxController implements ButtonController{

  @override
  var icon;

  RadioController({Key key, this.icon});

  @override
  void onInit() {
    super.onInit();
    setIcon();
  }

  @override
  void onPressed() {
    RadioApi.isPlaying().then((value) => print(value));
    RadioApi.toggleState();
    setIcon();
    RadioApi.isPlaying().then((value) => print(value));
    update();
  }

  void setIcon(){
    RadioApi.isPlaying().then((value) => icon = value? Icons.play_arrow : Icons.pause);
  }

  @override
  buttonController(buttonProperties) => GetBuilder<RadioController>(
      init: this,
      builder: (_controller) =>
          Icon(_controller.icon, size: buttonProperties.iconSize(), color: buttonProperties.iconColor));


}