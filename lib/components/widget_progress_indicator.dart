import 'package:flutter/material.dart';

class WidgetProgressIndicator extends StatelessWidget {
  const WidgetProgressIndicator({Key? key, required this.perctValue}) : super(key: key);

  final double perctValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.secondary),
        backgroundColor: Theme.of(context).colorScheme.primary,
        value: perctValue,
      ),
    );
  }
}