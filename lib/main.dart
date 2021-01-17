import 'package:adfradio/controllers/radio_controller.dart';
import 'package:adfradio/platform_api/info_api.dart';
import 'package:adfradio/ui/buttons.dart';
import 'package:adfradio/util/background.dart';
import 'package:flutter/material.dart';

import 'controllers/send_message_controller.dart';
import 'controllers/share_controller.dart';

void main() {
  Paint.enableDithering = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var info = InfoAPI();

    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: buildBackground()
          ),
          Row(
            children: [
              Expanded(child: AnimatedButton(controller: ShareController(icon: Icons.share), buttonProperties: ButtonProperties(radius: ButtonProperties.LITTLE_BUTTON))),
              Expanded(child: AnimatedButton(controller: RadioController(icon: Icons.play_arrow), buttonProperties: ButtonProperties(radius: ButtonProperties.BIG_BUTTON))),
              Expanded(child: AnimatedButton(controller: SendMessageController(icon: Icons.message), buttonProperties: ButtonProperties(radius: ButtonProperties.LITTLE_BUTTON))),
            ],
          )
        ],
      )
    );
  }
}
