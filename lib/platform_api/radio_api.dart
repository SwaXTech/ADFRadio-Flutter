import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RadioApi{

  static const platform_name = "/radio";
  static const platform_channel = const MethodChannel(platform_name);
  static const PLAY = 'play';
  static const STOP = 'stop';
  static const ISPLAYING = 'isPlaying';

  static Future<void> sendPlatformChannelMessage(String method) async => await platform_channel.invokeMethod(method);
  static Future<bool> isPlaying() async => await platform_channel.invokeMethod(ISPLAYING);


  static void play() => sendPlatformChannelMessage(PLAY);
  static void stop() => sendPlatformChannelMessage(STOP);

  static void toggleState() => isPlaying().then((value) => value? stop() : play());

}