import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:simulador_credito_rispar/models/simulation_model.dart';
import 'package:simulador_credito_rispar/models/simulation_request.dart';
import 'package:simulador_credito_rispar/repositories/simulation_repository.dart';
import 'package:simulador_credito_rispar/repositories/simulation_repository_interface.dart';

import 'enum_state_controller.dart';

part 'simulation_controller.g.dart';

class SimulationController = SimulationControllerBase
    with _$SimulationController;

abstract class SimulationControllerBase with Store {
  final ISimulationRepository simulationRepository;

  SimulationControllerBase(this.simulationRepository);

  @observable
  StateController stateSimulation = StateController.idle;

  SimulationRequest simulationRequest = SimulationRequest();

  SimulationModel? simulationModel;

  Future<SimulationModel?> saveSimulation() async {
    try {
      stateSimulation = StateController.loading;

      simulationModel =
          await simulationRepository.postSimulation(simulationRequest);

      stateSimulation = StateController.success;
      return simulationModel;
    } catch (e) {
      debugPrint(e.toString());
      stateSimulation = StateController.error;
    }
  }
}
