import 'package:adfradio/radio_api/radio_api.dart';
import 'package:flutter/material.dart';

class StatefulButton extends StatefulWidget {

  final radius;
  final onPressed;
  final iconColor = Colors.white;
  final buttonColor = Color.fromRGBO(39, 39, 39, 0.4);
  final alignment = Alignment.center;
  final iconSize = 40.0;


  StatefulButton({Key key, this.radius, this.onPressed});

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
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Icon(icon, size: widget.iconSize, color: widget.iconColor)
      ),
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          primary: widget.buttonColor
      ),
      onPressed: (){
        setState(() {
          setIcon();
        });
        RadioApi.toggleState();
      },
    );
  }
}