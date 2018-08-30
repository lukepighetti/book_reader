import 'package:flutter/material.dart';
import '../bloc.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StreamBuilder(
          stream: BlocProvider.of(context).currentColor,
          initialData: Colors.blue,
          builder: (context, AsyncSnapshot<Color> snapshot) => Container(
                decoration: BoxDecoration(
                  color: snapshot.data,
                  image: DecorationImage(
                    image: AssetImage("assets/overlay.png"),
                    fit: BoxFit.cover,
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

// class AnimatedContainer extends AnimatedWidget{
//   Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: new Align(
//         alignment: alignment,
//         heightFactor: axis == Axis.vertical ? math.max(sizeFactor.value, 0.0) : null,
//         widthFactor: axis == Axis.horizontal ? math.max(sizeFactor.value, 0.0) : null,
//         child: child,
//       )
//     );
//   }
// }
