import 'package:adfradio/model/song.dart';
import 'package:flutter/services.dart';

class InfoAPI{
  static const platform_name = "/info";
  static final platformChannel = MethodChannel(platform_name);
  static const URL = 'url';
  static const METADATA = 'metadata';

  InfoAPI(updateSong){

    platformChannel.setMethodCallHandler((call){

      if(call.method == METADATA){
        Song song = Song(call.arguments[1].toString(), call.arguments[0].toString());
        updateSong(song);
      }

      return null;

    });

  }
}