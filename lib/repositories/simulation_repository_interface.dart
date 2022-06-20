import 'package:simulador_credito_rispar/models/simulation_request.dart';

abstract class ISimulationRepository {
  Future postSimulation(SimulationRequest simulationRequest);
}
