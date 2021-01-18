import 'package:adfradio/controllers/radio_controller.dart';
import 'package:adfradio/platform_api/info_api.dart';
import 'package:adfradio/ui/buttons.dart';
import 'package:adfradio/util/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'controllers/send_message_controller.dart';
import 'controllers/share_controller.dart';
import 'controllers/text_controller.dart';

void main() {
  Paint.enableDithering = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'ADFRadio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget{

  final controller = TextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: buildBackground()
          ),
          Column(
            children: [
              Expanded(
                child: GetBuilder<TextController>(
                  init: controller,
                  builder: (_controller) => Column(
                    children: [
                      Obx(()=> Text(_controller.name.value, style: TextStyle(fontSize: 20, color: Colors.white), textAlign: TextAlign.center, maxLines: 2,)),
                      Obx(()=> Text(_controller.artist.value, style: TextStyle(fontSize: 17, color: Colors.white), textAlign: TextAlign.center, maxLines: 2,))
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ),
              PlayerButtons(),
            ],
          )
        ],
      )
    );
  }
}

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(
        children: [
          Expanded(child: AnimatedButton(controller: ShareController(icon: Icons.share), buttonProperties: ButtonProperties(radius: ButtonProperties.LITTLE_BUTTON))),
          Expanded(child: AnimatedButton(controller: RadioController(icon: Icons.play_arrow), buttonProperties: ButtonProperties(radius: ButtonProperties.BIG_BUTTON))),
          Expanded(child: AnimatedButton(controller: SendMessageController(icon: Icons.message), buttonProperties: ButtonProperties(radius: ButtonProperties.LITTLE_BUTTON))),
        ],
      ),
    );
  }
}
