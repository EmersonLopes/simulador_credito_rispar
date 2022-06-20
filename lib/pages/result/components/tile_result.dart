import 'package:flutter/material.dart';

class TileResult extends StatelessWidget {
  const TileResult({Key? key, required this.label, required this.result})
      : super(key: key);

  final String label;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(2.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(result,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black45)),

            ],
          ),
          Divider(
            thickness: 1.0,
          )
        ],
      ),
    );
  }
}
