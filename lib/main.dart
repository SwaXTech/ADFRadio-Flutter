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
          Positioned(child: Button(), bottom: 150, left: 148,)
        ],
      )
    );
  }
}

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Icon(Icons.play_arrow, size: 40,)
      ),
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          primary: Color.fromRGBO(39, 39, 39, 0.4)
      ),
      onPressed: RadioApi.toggleState,
    );
  }
}
