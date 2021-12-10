// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';

class Diamond extends StatefulWidget {
  const Diamond(this.userInput, {Key? key}) : super(key: key);
  final int userInput;
  @override
  _DiamondState createState() => _DiamondState();
}

class _DiamondState extends State<Diamond> {
  late int boxes;
  late int row;
  late int input;
  @override
  void initState() {
    row = (2 * widget.userInput) - 1;
    boxes = pow(row, 2).toInt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.9,
          width: double.infinity,
          child: SizedBox(
            width: double.infinity,
            child: GridView.count(
              crossAxisSpacing: 1,
              mainAxisSpacing: 2,
              crossAxisCount: row,
              children: <Widget>[...pattern(widget.userInput)],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> pattern(int userInput) {
    var listWidget = <Widget>[];
    int size = row;
    int start, end, mid;
    int start1 = 0;
    start = end = mid = size ~/ 2;
    for (int row = 0; row < size; row++) {
      for (int col = 0; col < size; col++) {
        if (col >= start && col <= end) {
          start1++;
          listWidget.add(Container(
            color: Colors.red,
            alignment: Alignment.center,
            child:
                start1 <= userInput ? Text('${row + 1}') : Text('${col + 1}'),
          ));
        } else {
          listWidget.add(const SizedBox());
        }
      }
      if (row < mid) {
        start--;
        end++;
      } else {
        start++;
        end--;
      }
    }
    print(listWidget.length);
    return listWidget;
  }
}
