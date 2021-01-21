import 'package:adfradio/model/song.dart';
import 'package:adfradio/platform_api/info_api.dart';
import 'package:adfradio/util/logger.dart';
import 'package:get/get.dart';


class TextController extends GetxController{

  var name = "ADF Radio".obs;
  var artist = "Asamblea de Dios Flores".obs;
  static var api;

  TextController(){
    api = InfoAPI(updateSong);
  }


  updateSong(Song song){

    Log.info("Updating metadata texts: ${song.name} - ${song.artist}");

    name.value = song.name;
    artist.value = song.artist;
  }

  @override
  void onInit() {
    super.onInit();
    Log.info("Text Controller initialized. Current SongName: $name. Current Artist Name: $artist");
  }
}