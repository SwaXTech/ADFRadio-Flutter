import 'package:adfradio/info_api/info_api.dart';
import 'package:adfradio/util/background.dart';
import 'package:flutter/material.dart';
import 'package:adfradio/radio_api/radio_api.dart';

void main() {
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
      body: Container(
        decoration: buildBackground(),
      child: Center(
            child: Button(),
        ),
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
          color: Color.fromRGBO(39, 39, 39, 1),
          borderRadius: BorderRadius.circular(100),
        ),
        height: 100,
        width: 100,
        child: Icon(Icons.play_arrow, size: 35, color: Colors.white,),
      ),
      onTap: RadioApi.toggleState,
    );
  }
}
