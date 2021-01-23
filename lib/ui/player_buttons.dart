import 'package:adfradio/controllers/radio_controller.dart';
import 'package:adfradio/controllers/send_message_controller.dart';
import 'package:adfradio/controllers/share_controller.dart';
import 'package:adfradio/controllers/wave_controller.dart';
import 'package:adfradio/model/button_properties.dart';
import 'package:adfradio/ui/buttons.dart';
import 'package:adfradio/util/logger.dart';
import 'package:flutter/material.dart';

class PlayerButtons extends StatelessWidget {

  final waveController;

  const PlayerButtons({Key key, this.waveController}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Log.debug("Building buttons");

    return Padding(
      padding: const EdgeInsets.only(bottom: 70.0),
      child: Row(
        children: [
          Expanded(child: ButtonWithController(controller: ShareController(icon: Icons.share), buttonProperties: ButtonProperties(radius: ButtonProperties.LITTLE_BUTTON))),
          Expanded(child: ButtonWithController(controller: RadioController(icon: Icons.play_arrow, waveController: waveController), buttonProperties: ButtonProperties(radius: ButtonProperties.BIG_BUTTON))),
          Expanded(child: ButtonWithController(controller: SendMessageController(icon: Icons.message), buttonProperties: ButtonProperties(radius: ButtonProperties.LITTLE_BUTTON))),
        ],
      ),
    );
  }
}