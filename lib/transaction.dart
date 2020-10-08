import 'package:flutter/cupertino.dart';

class Trnsaction{
  final String id;
  final String title;
  final double price;
  final DateTime date;

  Trnsaction({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.date});
}