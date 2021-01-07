
import 'package:adfradio/platform_api/radio_api.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

abstract class ButtonController extends GetxController{
  IconData icon;
  void onPressed();
}

class RadioController extends ButtonController{

  RadioController({Key key, this.icon});

  @override
  void onInit() {
    super.onInit();
    setIcon();
  }

  @override
  void onPressed() {
    RadioApi.toggleState();
    setIcon();
    update(['playButton']);
  }

  void setIcon(){
    RadioApi.isPlaying().then((value) => icon = value? Icons.play_arrow : Icons.pause);
  }

  @override
  var icon;
  
  
}