import 'package:flutter/material.dart';
import '../bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    BlocProvider.of(context).hasOnboarded.listen((hasOnboarded) {
      if (hasOnboarded)
        _controller.reverse();
      else
        _controller.forward();
    });

    return SizeTransition(
      sizeFactor: _animation,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => BlocProvider.of(context).onboarded(false),
              child: Image.asset(
                "assets/logo.png",
                width: 90.0,
              ),
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
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _Button extends StatefulWidget {
  @override
  __ButtonState createState() => __ButtonState();
}

class __ButtonState extends State<_Button> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      lowerBound: 0.0,
      upperBound: 1.0,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

    bloc.hasOnboarded.listen((hasOnboarded) {
      print(hasOnboarded);
      if (hasOnboarded)
        _controller.reverse();
      else
        _controller.forward();
    });

    return FadeTransition(
      opacity: _animation,
      child: Center(
        child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
          onPressed: () => bloc.onboarded(true),
          child: Text(
            "START EXPLORING",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99.9),
          ),
        ),
      ),
    );
  }
}
