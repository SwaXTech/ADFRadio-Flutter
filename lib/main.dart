import 'package:adfradio/info_api/info_api.dart';
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(15, 15, 15, 1),Color.fromRGBO(66, 71, 89, 1)],
            begin: FractionalOffset.bottomRight,
            end: FractionalOffset.topLeft
          )
        ),
        child: Button(),
      )
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          RadioApi.toggleState();
          final snackBar = SnackBar(
            content: Text('Yay! A SnackBar!'),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}
