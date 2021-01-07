import 'package:adfradio/platform_api/info_api.dart';
import 'package:adfradio/ui/buttons.dart';
import 'package:adfradio/util/background.dart';
import 'package:flutter/material.dart';

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
          Positioned(child: StatefulButton(radius: 100.0, ), bottom: 150, left: 148,)
        ],
      )
    );
  }
}
