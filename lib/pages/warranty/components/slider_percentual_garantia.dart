import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_credito_rispar/controllers/simulation_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderPercentualGarantia extends StatefulWidget {
  const SliderPercentualGarantia({Key? key}) : super(key: key);

  @override
  State<SliderPercentualGarantia> createState() =>
      _SliderPercentualGarantiaState();
}

class _SliderPercentualGarantiaState extends State<SliderPercentualGarantia> {
  late SimulationController simulationController;

  @override
  void initState() {
    simulationController = context.read<SimulationController>();
    simulationController.simulationRequest.ltv = 20;
  }

  @override
  Widget build(BuildContext context) {
    return SfSlider(
      min: 20.0,
      max: 50.0,
      value: simulationController.simulationRequest.ltv,
      interval: 15,
      stepSize: 15,
      labelFormatterCallback: (value, _) {
        return '$_ %';
      },
      activeColor: Theme.of(context).colorScheme.secondary,
      dividerShape: const SfDividerShape(),
      showLabels: true,
      onChanged: (value) {
        setState(() {
          simulationController.simulationRequest.ltv =
              int.parse(value.toStringAsFixed(0));
        });
      },
    );
  }
}
