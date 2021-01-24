import 'package:adfradio/controllers/wave_controller.dart';
import 'package:adfradio/ui/background.dart';
import 'package:adfradio/ui/player_buttons.dart';
import 'package:adfradio/ui/song_info.dart';
import 'package:adfradio/ui/top_title.dart';
import 'package:adfradio/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Log.debug("Building Radio Screen");

    final waveController = WaveController();

    return Scaffold(
        body: Stack(
          children: [
            Background(),
            Column(
              children: [
                TopTitle(),
                Expanded(
                  child: GetBuilder<WaveController>(
                    init: waveController,
                    builder: (_controller) => Stack(
                      children: [
                        Center(
                          child: Obx(() => AnimatedOpacity(
                              duration: Duration(milliseconds: 1500),
                              opacity: _controller.opacity,
                              child: Container(
                                  padding: EdgeInsets.only(left: 20.0, top: 8.0),
                                  child: Image(image: AssetImage("assets/dots.png"),)
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Obx(() => AnimatedOpacity(
                              duration: Duration(seconds: 1),
                              opacity: _controller.opacity,
                              child: Container(
                                  padding: EdgeInsets.only(left: 20.0, top: 8.0),
                                  child: Image(image: AssetImage("assets/opaque_wave.png"),)
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Obx(() => AnimatedOpacity(
                                duration: Duration(milliseconds: 500),
                                opacity: _controller.opacity,
                                child: Container(
                                    padding: EdgeInsets.only(left: 20.0, top: 8.0),
                                    child: Image(image: AssetImage("assets/gradient_wave.png")),
                                ),
                              ),
                            ),
                          ),
                        Center(
                          child: Container(
                            child: SongInfo(),
                            height: 270,
                            width: 270,
                            decoration: BoxDecoration(shape: BoxShape.circle, color: Color.fromRGBO(45, 47, 60, 1)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                PlayerButtons(waveController: waveController),
              ],
            )
          ],
        )
    );
  }
}
