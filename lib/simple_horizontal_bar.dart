library simple_horizontal_bar;

import 'package:flutter/material.dart';

import 'model/data_model.dart';

// Create a separate file for data models if necessary.

class BarChart extends StatefulWidget {
  final String title;
  final DataModel dataSet;

  const BarChart({
    Key? key,
    required this.title,
    required this.dataSet,
  }) : super(key: key);

  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  int selectedBar = 0;

  @override
  Widget build(BuildContext context) {
    final widths = (MediaQuery.of(context).size.width -
        (widget.dataSet.padding.left + widget.dataSet.padding.right));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: widget.dataSet.padding.bottom,
            left: widget.dataSet.padding.left,
            right: widget.dataSet.padding.right,
            top: widget.dataSet.padding.top,
          ),
          child: SizedBox(
            height: widget.dataSet.barHeight,
            width: widths,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widget.dataSet.value.map((e) {
                return Tooltip(
                  preferBelow: true,
                  textStyle: TextStyle(
                    color: widget.dataSet.fontColor,
                    fontWeight: widget.dataSet.fontWeight,
                    fontSize: widget.dataSet.fontSize,
                  ),
                  enableTapToDismiss: true,
                  exitDuration: const Duration(seconds: 10),
                  decoration: BoxDecoration(color: e.bgColor.withOpacity(1.0)),
                  message:
                      '${e.name}\n${(e.individualNumber / widget.dataSet.value.fold(0, (previousValue, element) => previousValue + element.individualNumber) * 100).toStringAsFixed(2)}% (${widget.dataSet.value.fold(0, (previousValue, element) => previousValue + element.individualNumber.toInt()).toString()})',
                  triggerMode: TooltipTriggerMode.tap,
                  onTriggered: () {
                    setState(() {
                      selectedBar = widget.dataSet.value.indexOf(e);
                    });
                  },
                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    duration: const Duration(seconds: 2),
                    height: selectedBar == widget.dataSet.value.indexOf(e)
                        ? widget.dataSet.barHeight
                        : widget.dataSet.barHeight - 10,
                    width: (e.individualNumber *
                        widths /
                        widget.dataSet.value.fold(
                            0,
                            (previousValue, element) =>
                                previousValue + element.individualNumber)),
                    decoration: BoxDecoration(
                      borderRadius: widget.dataSet.borderRadius != null &&
                              (e == widget.dataSet.value.last) &&
                              selectedBar != widget.dataSet.value.indexOf(e)
                          ? BorderRadius.only(
                              topRight:
                                  Radius.circular(widget.dataSet.borderRadius!),
                              bottomRight:
                                  Radius.circular(widget.dataSet.borderRadius!))
                          : widget.dataSet.borderRadius != null &&
                                  (e == widget.dataSet.value.first) &&
                                  selectedBar != widget.dataSet.value.indexOf(e)
                              ? BorderRadius.only(
                                  topLeft: Radius.circular(
                                      widget.dataSet.borderRadius!),
                                  bottomLeft: Radius.circular(
                                      widget.dataSet.borderRadius!))
                              : BorderRadius.circular(0),
                      color: e.bgColor.withOpacity(1.0),
                    ),
                    child: FittedBox(
                      child: Text(
                        style: TextStyle(
                          color: widget.dataSet.fontColor,
                          fontWeight: widget.dataSet.fontWeight,
                          fontSize: widget.dataSet.fontSize,
                        ),
                        widget.dataSet.showType == ShowType.percentage
                            ? '${(e.individualNumber / widget.dataSet.value.fold(0, (previousValue, element) => previousValue + element.individualNumber) * 100).toStringAsFixed(2)}%'
                            : e.individualNumber.toString(),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
