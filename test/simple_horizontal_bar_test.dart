import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_horizontal_bar/model/data_model.dart';

import 'package:simple_horizontal_bar/simple_horizontal_bar.dart';

void main() {
  test('adds one to input values', () {
    final calculator = SimpleBarChart(
      dataSet: DataModel(
          showType: ShowType.value,
          padding: PaddingValue(bottom: 10, left: 10, right: 20, top: 5),
          fontColor: Colors.white,
          borderRadius: 10,
          value: [
            ValueModel(
              individualNumber: 40,
              name: 'First',
              bgColor: Colors.green,
            ),
            ValueModel(
                individualNumber: 150, name: 'Second', bgColor: Colors.amber),
            ValueModel(
                individualNumber: 180,
                name: 'Third',
                bgColor: Colors.blueAccent),
            ValueModel(
                individualNumber: 180,
                name: 'Fourth',
                bgColor: Colors.purpleAccent),
            ValueModel(
                individualNumber: 450, name: 'Fourth', bgColor: Colors.red),
          ]),
    );
    // expect(calculator);
  });
}
