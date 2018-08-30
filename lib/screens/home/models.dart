import 'package:flutter/widgets.dart' show ImageProvider, Color;
import 'dart:math' show max, min;

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

class ColorTransition {
  List<Color> colors;
  double offset;
  double maxExtent;

  Color blendedColor;

  int length;

  ColorTransition({
    this.colors,
    this.offset,
    this.maxExtent,
    this.length,
  }) {
    double period = maxExtent / (colors.length - 1);
    int index = max(0, (offset / period).floor());

    Color firstColor = colors[index];

    if (index != colors.length - 1) {
      Color secondColor = colors[index + 1];
      double blend = (min(max(0.0, offset), maxExtent) % period) / period;

      // print(blend);

      this.blendedColor = Color.alphaBlend(
        firstColor.withOpacity(1.0 - blend),
        secondColor.withOpacity(blend),
      );
    } else {
      this.blendedColor = firstColor;
    }

    // this.blendedColor = Color.fromARGB(100, 100, 100, 100);
  }
}
