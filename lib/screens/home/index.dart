import 'package:flutter/material.dart';

import 'bloc.dart';

import 'widgets/background.dart';
import 'widgets/header.dart';
import 'widgets/drawer.dart';
import 'widgets/bookshelf.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        homeBloc: HomeBloc(),
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.bottomRight,
      children: <Widget>[
        Background(),
        Header(),
        MyDrawer(),
        Bookshelf(),
        // _Pages(),
      ],
    );
  }
}
