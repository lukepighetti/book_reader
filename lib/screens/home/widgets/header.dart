import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 160),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.animateTo(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      child: _Column(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _Column extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // icon
          Image.asset(
            "assets/logo.png",
            width: 90.0,
          ),
          SizedBox(height: 36.0),
          Text(
            "Discover. Learn. Elevate.",
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
          SizedBox(height: 36.0),
          _Button(),
        ],
      ),
    );
  }
}

class _Button extends StatefulWidget {
  @override
  __ButtonState createState() => __ButtonState();
}

class __ButtonState extends State<_Button> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
      onPressed: () => print('start exploring'),
      child: Text(
        "START EXPLORING",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(99.9),
      ),
    );
  }
}
