import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_credito_rispar/components/widget_default_buttom.dart';
import 'package:simulador_credito_rispar/controllers/simulation_controller.dart';
import 'package:simulador_credito_rispar/models/simulation_model.dart';
import 'package:simulador_credito_rispar/utils/app_routes.dart';

import 'tile_result.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late SimulationController simulationController;
  SimulationModel? model;

  @override
  void initState() {
    simulationController = context.read<SimulationController>();
    model = simulationController.simulationModel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.85,
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
              TileResult(
                  label: "Valor escolhido",
                  result: 'R\$ ${model?.netValue?.toStringAsFixed(2)}'),
              TileResult(
                  label: "Garantia",
                  result:
                      '₿ ${model?.getBitcoinFromSats().toStringAsFixed(8)}'),
              TileResult(
                  label: "Taxa de juros",
                  result: '${model?.interestRate?.toStringAsFixed(2)}% a.m'),
              TileResult(
                  label: "Percentual de garantia", result: '${model?.ltv}%'),
              TileResult(
                  label: "IOF",
                  result: 'R\$ ${model?.iofFee?.toStringAsFixed(2)}'),
              TileResult(
                  label: "Tarifa da plataforma",
                  result: 'R\$ ${model?.originationFee?.toStringAsFixed(2)}'),
              TileResult(
                  label: "Total financiado",
                  result: 'R\$ ${model?.contractValue?.toStringAsFixed(2)}'),
              TileResult(
                  label: "CET mensal",
                  result: '${model?.monthlyRate?.toStringAsFixed(2)}%'),
              TileResult(
                  label: "CET anual",
                  result: '${model?.annualRate?.toStringAsFixed(2)}%'),
              TileResult(
                  label: "Cotação do BTC",
                  result:
                      'R\$ ${model?.collateralUnitPrice?.toStringAsFixed(2)}'),
              SizedBox(height: 6.0),
            ],
          ),
          WidgetDefaultButtom(
              text: 'Nova Simulação',
              press: () {
                Navigator.pushNamed(context, AppRoutes.USER);
              }),

        ],
      ),
    );
  }
}
