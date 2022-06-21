import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:simulador_credito_rispar/components/widget_progress_indicator.dart';
import 'package:simulador_credito_rispar/controllers/enum_state_controller.dart';
import 'package:simulador_credito_rispar/controllers/simulation_controller.dart';

import 'components/loading_simulation.dart';
import 'components/body.dart';
import 'components/error_simulation.dart';

class WarrantyPage extends StatefulWidget {
  const WarrantyPage({Key? key}) : super(key: key);

  @override
  State<WarrantyPage> createState() => _WarrantyPageState();
}

class _WarrantyPageState extends State<WarrantyPage> {
  late SimulationController simulationController;

  @override
  void initState() {
    simulationController = context.read<SimulationController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(elevation: 0, title: WidgetProgressIndicator(perctValue: 0.66,)),
        body: Observer(
          builder: (BuildContext context) {
            print('>>>> ${simulationController.stateSimulation}');
            switch (simulationController.stateSimulation) {
              case StateController.loading:
                return LoadingSimulation();
              case StateController.error:
                return ErrorSimulation(
                  onButtonClick: () async {
                    simulationController.saveSimulation();
                  },
                );
              case StateController.success:
              default:
                return Body();
            }
          },
        ));
  }
}
