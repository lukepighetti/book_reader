import 'package:flutter/widgets.dart' show ImageProvider, Color;

class Book {
  int isbn;
  String title;
  String author;
  ImageProvider hero;
  Color color;
  String body;

  Book({
    this.isbn,
    this.title,
    this.author,
    this.hero,
    this.color,
    this.body,
  });
}
