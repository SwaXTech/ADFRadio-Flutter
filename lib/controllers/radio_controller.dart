import 'package:adfradio/controllers/button_controller.dart';
import 'package:adfradio/platform_api/radio_api.dart';
import 'package:adfradio/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioController extends GetxController implements ButtonController{

  @override
  var icon;

  final waveController;

  RadioController({Key key, this.icon, this.waveController});

  @override
  void onInit() {
    super.onInit();
    setIcon();
    logInit();
  }

  @override
  void onPressed() {
    log();
    RadioApi.toggleState();
    setIcon();
    updateWave();
    update();
  }

  @override
  buttonController(buttonProperties) {
    return GetBuilder<RadioController>(
      init: this,
      builder: (_controller) {
        return Icon(
            _controller.icon,
            size: buttonProperties.iconSize(),
            color: buttonProperties.iconColor
        );
      });
  }

  void setIcon() => RadioApi.isPlaying().then((value) => icon = value? Icons.play_arrow : Icons.pause);

  void updateWave() => RadioApi.isPlaying().then((value) => value? waveController.fadeIn() : waveController.fadeOut());

  bool isPauseButton() => icon == Icons.pause;
  bool isPlayButton() => icon == Icons.play_arrow;

  void log() {

    RadioApi.isPlaying().then((_isPlaying){

      if(_isPlaying && isPauseButton())
        Log.debug("Pause button was pressed. Stopping Radio");

      if(!_isPlaying && isPlayButton())
        Log.debug("Play button was pressed. Starting Radio");

      if(_isPlaying && isPlayButton())
        Log.wtf("Play button was pressed. But radio is already playing");

      if(!_isPlaying && isPauseButton())
        Log.wtf("Pause button was pressed. But radio is stopped");

    });
  }

  void logInit() {

    const String prefix = "[Radio Controller] -> Initializing: ";
    const String playing = "Radio is Playing";
    const String notPlaying = "Radio is not Playing";

    RadioApi.isPlaying().then((isPlaying)=> Log.info(prefix + (isPlaying ? playing : notPlaying)));
  }
}
