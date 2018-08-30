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
  PageController _pageController;

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

    _pageController = PageController(
      viewportFraction: 0.9,
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

    _pageController.addListener(() {
      BlocProvider.of(context).setScrollPosition(
            _pageController.offset / _pageController.position.maxScrollExtent,
          );
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
            padding: EdgeInsets.only(top: 36.0, bottom: 28.0),
            height: MediaQuery.of(context).size.height * .72,
            child: StreamBuilder(
              stream: BlocProvider.of(context).books,
              initialData: <Book>[],
              builder: (context, AsyncSnapshot<List<Book>> snapshot) {
                /// setup listener for color transition
                _pageController.addListener(() {
                  if (snapshot.data.isNotEmpty)
                    BlocProvider.of(context).setColor(
                          ColorTransition(
                            colors: snapshot.data
                                .map((book) => book.color)
                                .toList(),
                            offset: _pageController.offset,
                            maxExtent: _pageController.position.maxScrollExtent,
                          ),
                        );
                });

                return PageView(
                  controller: _pageController,
                  children:
                      snapshot.data.map((book) => MyBook(book: book)).toList(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class MyBook extends StatelessWidget {
  final Book book;
  MyBook({this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24.0, horizontal: 10.0),
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
