import 'package:flutter/material.dart';
import 'package:resturant_ui/models/dish.dart';

class Category {
  final String id, title;
  final IconData icon;
  final List<Dish> dishes;

  Category(
      {@required this.dishes,
      @required this.id,
      @required this.title,
      @required this.icon});
}
