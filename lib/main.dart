import 'package:adfradio/info_api/info_api.dart';
import 'package:adfradio/util/background.dart';
import 'package:flutter/material.dart';
import 'package:adfradio/radio_api/radio_api.dart';

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
          Positioned(child: Button(), bottom: 150, left: 150,)
        ],
      )
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(39, 39, 39, 0.7),
          borderRadius: BorderRadius.circular(100),
        ),
        height: 120,
        width: 120,
        child: Icon(Icons.play_arrow, size: 50, color: Colors.white,),
      ),
      onTap: RadioApi.toggleState,
    );
  }
}
