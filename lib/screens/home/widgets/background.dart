import 'package:flutter/material.dart';
import '../bloc.dart';
import 'package:rxdart/rxdart.dart' show Observable;
import '../models.dart' show DoubleColor;
import 'dart:math' show max;

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        StreamBuilder(
          stream: Observable.combineLatest2(
              BlocProvider.of(context).scrollPosition,
              BlocProvider.of(context).currentColor,
              (double a, Color b) => DoubleColor(a, b)),
          initialData: DoubleColor(0.0, Colors.indigo[700]),
          builder: (context, AsyncSnapshot<DoubleColor> snapshot) => Container(
                margin: EdgeInsets.only(
                  /// TODO refactor this so we can allow iOS to pull down by paging far left
                  bottom: max(0.0, snapshot.data.number) * 100,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: snapshot.data.color,
                    image: DecorationImage(
                      image: AssetImage("assets/overlay.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 36.0),
          alignment: Alignment.bottomCenter,
          child: Text(
            "BY LUKE PIGHETTI",
            style: TextStyle(fontSize: 10.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
