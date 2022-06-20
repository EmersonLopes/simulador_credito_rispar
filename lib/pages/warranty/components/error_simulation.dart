import 'package:flutter/material.dart';

class ErrorSimulation extends StatelessWidget {
  const ErrorSimulation({Key? key, this.onButtonClick}) : super(key: key);

  final VoidCallback? onButtonClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
//          Image(image: AssetImage('assets/images/gif_one.png'), width: 100.0, height: 100.0,),
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 80.0,
          ),

          const Text(
            "Houve um problema! Tente novamente.",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          const SizedBox(
            height: 8.0,
          ),
          MaterialButton(
            onPressed: onButtonClick,
            child: const Icon(
              Icons.refresh,
              size: 50.0,
            ),
          )
        ],
      ),
    );
  }
}
