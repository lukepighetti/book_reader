import 'package:flutter/material.dart';
import '../bloc.dart';
import '../models.dart';

class Bookshelf extends StatefulWidget {
  @override
  _BookshelfState createState() => _BookshelfState();
}

class _BookshelfState extends State<Bookshelf> with TickerProviderStateMixin {
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

    return Container(
      alignment: Alignment.bottomRight,
      child: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.horizontal,
        axisAlignment: -1.0,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            // color: Colors.grey,
            height: MediaQuery.of(context).size.height * .64,
            child: StreamBuilder(
              stream: BlocProvider.of(context).books,
              initialData: <Book>[],
              builder: (context, AsyncSnapshot<List<Book>> snapshot) =>
                  PageView(
                    children: snapshot.data
                        .map((book) => MyBook(book: book))
                        .toList(),
                  ),
            ),
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
      margin: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[600],
            blurRadius: 12.0,
            spreadRadius: -2.0,
            offset: Offset(0.0, 5.0),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(image: book.hero),
            SizedBox(height: 22.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    book.title,
                    style:
                        TextStyle(fontSize: 34.0, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 18.0),
                  Text(
                    'By ${book.author}',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 18.0),
                  RaisedButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
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
            )
          ],
        ),
      ),
    );
  }
}
