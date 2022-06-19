import 'package:simulador_credito_rispar/models/simulation_model.dart';

abstract class ISimulationRepository {
  Future postSimulation(SimulationRequest simulationRequest);
}
