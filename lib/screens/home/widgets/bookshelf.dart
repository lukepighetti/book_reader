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
    return Container(
      alignment: Alignment.bottomRight,
      child: Container(
        // color: Colors.grey,
        height: 440.0,
        child: StreamBuilder(
          stream: BlocProvider.of(context).books,
          builder: (context, AsyncSnapshot<List<Book>> snapshot) => PageView(
                children:
                    snapshot.data.map((book) => MyBook(book: book)).toList(),
              ),
        ),
      ),
    );
  }
}

class MyBook extends StatelessWidget {
  final Book book;
  MyBook({this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image(image: book.hero),
          SizedBox(height: 22.0),
          Text(
            book.title,
            style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 18.0),
          Text(
            'By ${book.author}',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 18.0),
          RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
            onPressed: () => print("read ${book.title}"),
            color: book.color,
            child: Text(
              "READ BOOK",
              style: TextStyle(color: Colors.white),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(99.9),
            ),
          ),
        ],
      ),
    );
  }
}
