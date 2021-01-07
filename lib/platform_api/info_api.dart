import 'package:flutter/services.dart';

class InfoAPI{
  static const platform_name = "/info";
  static const platform_channel = const MethodChannel(platform_name);
  static const URL = 'url';
  static const METADATA = 'metadata';

  InfoAPI(){

    platform_channel.setMethodCallHandler((call){

      if(call.method == METADATA){
        print(call.arguments);
      }

      return null;

    });

  }
}