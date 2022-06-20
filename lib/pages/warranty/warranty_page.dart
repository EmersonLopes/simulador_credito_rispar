import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:simulador_credito_rispar/controllers/enum_state_controller.dart';
import 'package:simulador_credito_rispar/controllers/simulation_controller.dart';
import 'package:simulador_credito_rispar/pages/warranty/components/loading_simulation.dart';

import 'components/body.dart';

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
        appBar: AppBar(elevation: 0),
        body: Observer(
          builder: (BuildContext context) {
            if (simulationController.stateSimulation ==
                StateController.loading) {
              return const LoadingSimulation();
            }
            return const Body();
          },
        ));
  }
}
