library simple_horizontal_bar;

import 'package:flutter/material.dart';

enum ShowType { percentage, value }

class DataModel {
  ShowType showType;
  List<ValueModel> value;
  Color fontColor;
  FontWeight fontWeight;
  double barHeight;
  double fontSize;
  double? borderRadius;
  final PaddingValue padding;

  DataModel({
    this.borderRadius = 0,
    required this.value,
    this.showType = ShowType.percentage,
    this.fontSize = 12,
    PaddingValue? padding,
    this.barHeight = 40,
    this.fontWeight = FontWeight.bold,
    this.fontColor = Colors.white,
  }) : padding = padding ?? PaddingValue();
}

class ValueModel {
  double individualNumber;
  String name;
  Color bgColor;

  ValueModel({
    required this.individualNumber,
    required this.bgColor,
    required this.name,
  });
}

class PaddingValue {
  double left;
  double right;
  double bottom;
  double top;

  PaddingValue({this.left = 0, this.right = 0, this.bottom = 0, this.top = 0});
}
