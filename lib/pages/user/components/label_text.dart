import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({Key? key, required this.firstText, required this.secondText})
      : super(key: key);

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(firstText,
            style: TextStyle(
              fontSize: 16,
            )),
        Text(secondText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
