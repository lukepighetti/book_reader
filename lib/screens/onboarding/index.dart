import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _Body()),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: 10.0),
          Column(
            children: <Widget>[
              Icon(Icons.person, size: 48.0),
              SizedBox(height: 36.0),
              Text(
                "Discover. Learn. Elevate.",
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
              SizedBox(height: 36.0),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                onPressed: () => print('start exploring'),
                child: Text(
                  "START EXPLORING",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99.9),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 24.0),
            child: Text(
              "BY LUKE PIGHETTI",
              style: TextStyle(fontSize: 12.0, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
