import 'package:flutter/material.dart';

import 'widgets/background.dart';
import 'widgets/header.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(),
        Header(),
        // _Drawer(),
        // _Pages(),
      ],
    );
  }
}
