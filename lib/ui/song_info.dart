import 'package:adfradio/controllers/text_controller.dart';
import 'package:adfradio/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SongInfo extends StatelessWidget {

  final TextController controller = TextController();

  @override
  Widget build(BuildContext context) {

    Log.debug("Building SongInfo");

    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: GetBuilder<TextController>(
          init: controller,
          builder: (_controller) => Column(
            children: [
              Obx(()=> Text(_controller.name.value, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center, maxLines: 2,)),
              Obx(()=> Text(_controller.artist.value, style: TextStyle(fontSize: 15, color: Colors.white, letterSpacing: 0.05), textAlign: TextAlign.center, maxLines: 2))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}