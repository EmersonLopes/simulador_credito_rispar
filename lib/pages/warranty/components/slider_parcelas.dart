import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_credito_rispar/controllers/simulation_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderParcelas extends StatefulWidget {
  const SliderParcelas({Key? key}) : super(key: key);

  @override
  State<SliderParcelas> createState() => _SliderParcelasState();
}

class _SliderParcelasState extends State<SliderParcelas> {

  late SimulationController simulationController;

  @override
  void initState() {
    simulationController = context.read<SimulationController>();
    simulationController.simulationRequest.term = 3;
  }


  @override
  Widget build(BuildContext context) {
    return SfSlider(
      min: 3.0,
      max: 12.0,
      value: simulationController.simulationRequest.term,
      interval: 3,
      stepSize: 3,
      showLabels: true,
      dividerShape: SfDividerShape(),
      activeColor: Theme.of(context).colorScheme.secondary,
      onChanged: (value) {
        setState(() {
          simulationController.simulationRequest.term =
              int.parse(value.toStringAsFixed(0));
        });
      },
    );
  }
}
