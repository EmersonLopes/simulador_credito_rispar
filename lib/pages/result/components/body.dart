import 'package:flutter/material.dart';
import 'package:simulador_credito_rispar/components/widget_default_buttom.dart';
import 'package:simulador_credito_rispar/utils/app_routes.dart';

import 'tile_result.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Resultado da simulação",
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          SizedBox(
            height: 36.0,
          ),
          Column(
            children: [
              TileResult(label: "Valor escolhido", result: 'R\$ 25.000'),
              TileResult(label: "Garantia", result: 'B 0.34789823'),
              TileResult(label: "Taxa de juros", result: '0.79% a.m'),
              TileResult(label: "Percentual de garantia", result: '35%'),
              TileResult(label: "IOF", result: 'R\$ 239,32'),
              TileResult(label: "Tarifa da plataforma", result: 'R\$ 385,14'),
              TileResult(label: "Total financiado", result: 'R\$ 26.324,32'),
              TileResult(label: "CET mensal", result: '2,69%'),
              TileResult(label: "CET anual", result: '37,46%'),
              TileResult(label: "Cotação do BTC", result: 'R\$ 322,356.71'),
              SizedBox(height: 6.0),
            ],
          ),
          WidgetDefaultButtom(
              text: 'Nova Simulação',
              press: () {
                Navigator.pushNamed(context, AppRoutes.USER);
              }),
              SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
