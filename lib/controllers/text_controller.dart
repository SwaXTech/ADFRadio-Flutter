import 'package:adfradio/model/song.dart';
import 'package:adfradio/platform_api/info_api.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TextController extends GetxController{

  var name = "ADF Radio".obs;
  var artist = "Asamblea de Dios Flores".obs;

  static const platform_name = "/info";
  static final platformChannel = MethodChannel(platform_name);
  static const URL = 'url';
  static const METADATA = 'metadata';
  static var api;

  TextController(){
    api = InfoAPI(updateSong);
  }


  updateSong(Song song){
    name.value = song.name;
    artist.value = song.artist;
  }

  @override
  void onInit() {
    super.onInit();
  }
}