import 'package:flutter/material.dart';
import '../bloc.dart';
import '../models.dart';

class Bookshelf extends StatefulWidget {
  @override
  _BookshelfState createState() => _BookshelfState();
}

class _BookshelfState extends State<Bookshelf> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: BlocProvider.of(context).books,
      builder: (context, AsyncSnapshot<List<Book>> snapshot) => PageView(
            children: snapshot.data.map((book) => MyBook(book: book)).toList(),
          ),
    );
  }
}

class MyBook extends StatelessWidget {
  final Book book;
  MyBook({this.book});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
