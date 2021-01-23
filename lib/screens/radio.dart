import 'package:adfradio/ui/background.dart';
import 'package:adfradio/ui/player_buttons.dart';
import 'package:adfradio/ui/song_info.dart';
import 'package:adfradio/ui/top_title.dart';
import 'package:adfradio/util/logger.dart';
import 'package:flutter/material.dart';

class RadioScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Log.debug("Building Radio Screen");
    return Scaffold(
        body: Stack(
          children: [
            Background(),
            Column(
              children: [
                TopTitle(),
                SongInfo(),
                PlayerButtons(),
              ],
            )
          ],
        )
    );
  }
}
