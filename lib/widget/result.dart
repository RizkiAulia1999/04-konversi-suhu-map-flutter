import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.result,
  }) : super(key: key);

  final double result;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Text("Hasil"),
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            result.toStringAsFixed(2),
            style: TextStyle(fontSize: 36),
          ),
        ),
      ],
    ));
  }
}
