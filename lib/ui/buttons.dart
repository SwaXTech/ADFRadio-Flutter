import 'package:adfradio/radio_api/radio_api.dart';
import 'package:flutter/material.dart';

class StatelessButton extends StatelessWidget {

  final radius;
  final icon;
  final onPressed;
  final iconColor = Colors.white;
  final buttonColor = Color.fromRGBO(39, 39, 39, 0.4);
  final alignment = Alignment.center;
  final iconSize = 40.0;

  StatelessButton({Key key, this.radius, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
          width: radius,
          height: radius,
          alignment: alignment,
          decoration: boxDecoration(),
          child: Icon(icon, size: iconSize, color: iconColor)
      ),
      style: circleButtonStyle(buttonColor),
      onPressed: onPressed,
    );
  }
}


class StatefulButton extends StatefulWidget {

  final radius;
  final iconColor = Colors.white;
  final buttonColor = Color.fromRGBO(39, 39, 39, 0.4);
  final alignment = Alignment.center;
  final iconSize = 40.0;
  
  StatefulButton({Key key, this.radius});

  @override
  _StatefulButtonState createState() => _StatefulButtonState();
}

class _StatefulButtonState extends State<StatefulButton> {

  var icon = Icons.play_arrow;

  @override
  void initState() {
    setIcon();
    super.initState();
  }

  setIcon(){
    RadioApi.isPlaying().then((value) => icon = value? Icons.play_arrow : Icons.pause);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Container(
          width: widget.radius,
          height: widget.radius,
          alignment: widget.alignment,
          decoration: boxDecoration(),
          child: Icon(icon, size: widget.iconSize, color: widget.iconColor)
      ),
      style: circleButtonStyle(widget.buttonColor),
      onPressed: (){
        RadioApi.toggleState();
        setState(() {
          setIcon();
        });
      },
    );
  }
}

BoxDecoration boxDecoration() => const BoxDecoration(shape: BoxShape.circle);
ButtonStyle circleButtonStyle(buttonColor) {
  return ElevatedButton.styleFrom(
      shape: const CircleBorder(),
      primary: buttonColor
  );
}
