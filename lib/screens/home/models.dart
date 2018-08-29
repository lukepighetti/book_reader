import 'package:flutter/widgets.dart' show Image, Color;

class Book {
  int isbn;
  String title;
  String author;
  Image hero;
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
