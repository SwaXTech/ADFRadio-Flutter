import 'package:adfradio/controllers/radio_controller.dart';
import 'package:adfradio/platform_api/info_api.dart';
import 'package:adfradio/ui/buttons.dart';
import 'package:adfradio/util/background.dart';
import 'package:flutter/material.dart';

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
              Expanded(child: Button(radius: 50.0, id: 'shareButton', iconSize: 20.0, controller: ShareController(icon: Icons.share))),
              Expanded(child: Button(radius: 100.0, id: 'playButton', iconSize: 40.0, controller: RadioController(icon: Icons.play_arrow))),
              Expanded(child: Button(radius: 50.0, id: 'sendMessageButton', iconSize: 20.0, controller: ShareController(icon: Icons.message))),

            ],
          )
        ],
      )
    );
  }
}
