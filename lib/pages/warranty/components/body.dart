import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_credito_rispar/components/widget_default_buttom.dart';
import 'package:simulador_credito_rispar/controllers/simulation_controller.dart';

import 'package:simulador_credito_rispar/pages/request_ammount/components/ammount_field.dart';
import 'package:simulador_credito_rispar/pages/user/components/label_text.dart';
import 'package:simulador_credito_rispar/utils/app_routes.dart';

import 'slider_parcelas.dart';
import 'slider_percentual_garantia.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  late SimulationController simulationController;

  @override
  void initState() {
    simulationController = context.read<SimulationController>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Valor escolhido",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      )),
                  Text(
                      'R\$ ${simulationController.simulationRequest.amount?.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        height: 1.5,
                      )),
                  const SizedBox(height: 20.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: const LabelText(
                      firstText: "Escolha a",
                      secondText: " quantidade de parcelas",
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  const SliderParcelas(),
                  const SizedBox(height: 20.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: const LabelText(
                      firstText: "Escolha o",
                      secondText: " percentual de garantia",
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  const SliderPercentualGarantia(),
                  const SizedBox(height: 12.0),
                  Text("Garantia protegida",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        height: 1.5,
                      )),
                  const SizedBox(height: 12.0),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: const Text(
                        "Bitcoin caiu? Fique tranquilo! Na garantia protegida, você não recebe chamada de margem e não é liquidado.",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black45)),
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
              Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          onPressed: () async => postSimulation(),
                          child: Text(
                            'Continuar sem garantia',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ))),
                  const SizedBox(height: 14.0),
                  WidgetDefaultButtom(
                    text: "Adicionar garantia",
                    press: () async => await postSimulation(garantia: true),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }

  postSimulation({bool garantia = false}) async {
    simulationController.simulationRequest.hasProtectedCollateral = garantia;
    print(simulationController.simulationRequest);
    var result = await simulationController.saveSimulation();
    if (result != null) {
      Navigator.pushNamed(context, AppRoutes.RESULT);
    }
  }
}
