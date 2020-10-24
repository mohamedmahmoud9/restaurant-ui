import 'package:flutter/material.dart';

class Dish with ChangeNotifier {
  final String id, title, description, image;
  final double price, rate, discount;

  Dish({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.image,
    @required this.price,
    @required this.rate,
    @required this.discount,
  });
}
