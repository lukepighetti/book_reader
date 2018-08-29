import 'dart:async' show Stream;
import 'package:rxdart/subjects.dart' show BehaviorSubject;
import 'package:flutter/widgets.dart';

import 'models.dart';
import 'mock.dart' as Mocks;

class HomeBloc {
  final _subject = BehaviorSubject<bool>(seedValue: true);

  Stream<bool> get hasOnboarded => _subject.stream;

  void onboarded(bool boolean) {
    _subject.add(boolean);
  }

  final _booksSubject = BehaviorSubject<List<Book>>(seedValue: Mocks.books);
  Stream<List<Book>> get books => _booksSubject.stream;
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
