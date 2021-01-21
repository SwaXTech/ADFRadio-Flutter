import 'package:adfradio/controllers/radio_controller.dart';
import 'package:adfradio/platform_api/log_api.dart';
import 'package:adfradio/ui/buttons.dart';
import 'package:adfradio/util/background.dart';
import 'package:adfradio/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:logger/logger.dart';
import 'controllers/send_message_controller.dart';
import 'controllers/share_controller.dart';
import 'controllers/text_controller.dart';

void main() {
  Paint.enableDithering = true;
  Log.setLogLevel(Level.debug);
  Log.debug("Initializing APP");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    LogAPI();

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
          Background(),
          Column(
            children: [
              TopTitle(),
              SongInfo(controller: controller),
              PlayerButtons(),
            ],
          )
        ],
      )
    );
  }
}

class SongInfo extends StatelessWidget {
  const SongInfo({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final TextController controller;

  @override
  Widget build(BuildContext context) {
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

class TopTitle extends StatelessWidget {
  const TopTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          Text("ADF Radio", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          Text("Asamblea de Dios Flores", style: TextStyle(color: Colors.white, fontSize: 15), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBackground()
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
      padding: const EdgeInsets.only(bottom: 70.0),
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
