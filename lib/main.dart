import 'package:adfradio/platform_api/log_api.dart';
import 'package:adfradio/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:adfradio/screens/radio.dart';

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
    Log.debug("Building APP");
    return GetMaterialApp(
      title: 'ADFRadio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RadioScreen(),
    );
  }
}