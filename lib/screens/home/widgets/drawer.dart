import 'package:flutter/material.dart';
import '../bloc.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> with TickerProviderStateMixin {
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
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of(context).hasOnboarded.listen((hasOnboarded) {
      if (hasOnboarded)
        _controller.forward();
      else
        _controller.reverse();
    });

    return SizeTransition(
      sizeFactor: _animation,
      axisAlignment: -1.0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.72,
        margin: EdgeInsets.only(top: 12.0),
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(32.0),
          boxShadow: <BoxShadow>[
            BoxShadow(blurRadius: 12.0, spreadRadius: -4.0)
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _TabBar(),
              _Progress(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 24.0),
      width: MediaQuery.of(context).size.width * 0.7,
      child: StreamBuilder(
        stream: BlocProvider.of(context).scrollPosition,
        initialData: 0.0,
        builder: (context, AsyncSnapshot<double> snapshot) =>
            LinearProgressIndicator(value: snapshot.data),
      ),
    );
  }
}

class _TabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: TabBar(
        labelStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        isScrollable: true,
        indicatorWeight: 4.0,
        indicatorPadding: EdgeInsets.all(12.0),
        tabs: [
          Tab(text: "BOOKS"),
          Tab(text: "PODCAST"),
          Tab(text: "WORKSHOPS"),
        ],
      ),
    );
  }
}
