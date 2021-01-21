import 'package:adfradio/controllers/button_controller.dart';
import 'package:adfradio/platform_api/radio_api.dart';
import 'package:adfradio/util/logger.dart';
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

    if(isPlaying()){
      Log.info("Initializing Radio Controller: Radio is Playing");
    } else {
      Log.info("Initializing Radio Controller: Radio is not Playing");
    }

  }

  @override
  void onPressed() {

    log();
    RadioApi.toggleState();
    setIcon();
    update();
  }

  void log() {
    var _isPlaying = isPlaying();
    
    if(_isPlaying && isPauseButton())
      Log.debug("Pause button was pressed. Stopping Radio");
    
    if(!_isPlaying && isPlayButton())
      Log.debug("Play button was pressed. Starting Radio");
    
    if(_isPlaying && isPlayButton())
      Log.wtf("Play button was pressed. But radio is already playing");
    
    if(!_isPlaying && isPauseButton())
      Log.wtf("Pause button was pressed. But radio is stopped");
    
  }

  void setIcon(){
    RadioApi.isPlaying().then((value) => icon = value? Icons.play_arrow : Icons.pause);
  }

  @override
  buttonController(buttonProperties) => GetBuilder<RadioController>(
      init: this,
      builder: (_controller) =>
          Icon(_controller.icon, size: buttonProperties.iconSize(), color: buttonProperties.iconColor));

  bool isPlaying(){
    bool _isPlaying;
    RadioApi.isPlaying().then((isPlaying) => _isPlaying = isPlaying);
    return _isPlaying;
  }

  bool isPauseButton() => icon == Icons.pause;
  bool isPlayButton() => icon == Icons.play_arrow;

}