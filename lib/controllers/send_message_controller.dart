import 'package:adfradio/controllers/button_controller.dart';
import 'package:adfradio/util/logger.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';

class SendMessageController extends GetxController implements ButtonController{

  @override
  var icon;

  SendMessageController({Key key, this.icon});

  @override
  onPressed() {
    Log.info("Send Message Button pressed");
  }

  @override
  buttonController(buttonProperties) => GetBuilder<SendMessageController>(
      init: this,
      builder: (_controller) =>
          Icon(_controller.icon, size: buttonProperties.iconSize(), color: buttonProperties.iconColor));

}