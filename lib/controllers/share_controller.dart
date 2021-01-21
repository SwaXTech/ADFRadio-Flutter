import 'package:adfradio/controllers/button_controller.dart';
import 'package:adfradio/util/logger.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';

class ShareController extends GetxController implements ButtonController{
  @override
  var icon;

  ShareController({Key key, this.icon});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  onPressed() {
    Log.info("Share controller");
  }

  @override
  buttonController(buttonProperties) => GetBuilder<ShareController>(
      init: this,
      builder: (_controller) =>
          Icon(_controller.icon, size: buttonProperties.iconSize(), color: buttonProperties.iconColor));

}