import 'dart:async' show Stream;
import 'package:rxdart/subjects.dart' show BehaviorSubject;
import 'package:flutter/widgets.dart';

class HomeBloc {
  final _subject = BehaviorSubject<bool>(seedValue: true);

  Stream<bool> get hasOnboarded => _subject.stream;

  void onboarded(bool boolean) {
    _subject.add(boolean);
  }
}

class BlocProvider extends InheritedWidget {
  final HomeBloc homeBloc;

  BlocProvider({
    Key key,
    HomeBloc homeBloc,
    Widget child,
  })  : homeBloc = homeBloc ?? HomeBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static HomeBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
          .homeBloc;
}
