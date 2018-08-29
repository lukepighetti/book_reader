import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(bottom: 36.0),
          alignment: Alignment.bottomCenter,
          child: Text(
            "BY LUKE PIGHETTI",
            style: TextStyle(fontSize: 10.0, color: Colors.white),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/overlay.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
