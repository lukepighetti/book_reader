import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  bool onboarding = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      lowerBound: 0.5,
      upperBound: 1.0,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  _handlePressed() {
    setState(() => onboarding = !onboarding);
  }

  @override
  Widget build(BuildContext context) {
    if (onboarding)
      _controller.forward();
    else
      _controller.reverse();

    return SizeTransition(
      sizeFactor: _animation,
      child: Center(
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
            _Button(
              onPressed: () => _handlePressed(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onPressed;
  _Button({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
      onPressed: () => onPressed(),
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
