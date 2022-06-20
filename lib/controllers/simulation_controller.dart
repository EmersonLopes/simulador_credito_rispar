import 'package:mobx/mobx.dart';
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

  @action
  Future saveSimulation() async {
    try {
      stateSimulation = StateController.loading;

      await simulationRepository.postSimulation(simulationRequest);

      stateSimulation = StateController.success;
      return null;
    } catch (e) {
      stateSimulation = StateController.error;
    }
  }
}
