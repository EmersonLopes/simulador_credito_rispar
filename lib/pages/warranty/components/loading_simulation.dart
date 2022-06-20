import 'package:flutter/material.dart';

class LoadingSimulation extends StatelessWidget {
  const LoadingSimulation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          SizedBox(
            height: 26.0,
          ),
          const Text(
            "Aguarde um momento",
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.63,
            child: const Text(
                "Estamos simulando seu pedido de crédito Rispar...",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black45)),
          ),
        ],
      ),
    );
  }
}
