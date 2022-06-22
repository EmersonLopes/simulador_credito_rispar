import 'package:simulador_credito_rispar/models/simulation_model.dart';
import 'package:simulador_credito_rispar/models/simulation_request.dart';
import 'package:simulador_credito_rispar/repositories/simulation_repository_interface.dart';
import 'package:simulador_credito_rispar/services/client_http_interface.dart';

import '../utils/constants.dart';

class SimulationRepository implements ISimulationRepository {
  final IClientHttp clientHttp;

  SimulationRepository(this.clientHttp);

  @override
  Future<SimulationModel> postSimulation(
      SimulationRequest simulationRequest) async {
    try {
      final response = await clientHttp.post(Constants.URL_SIMULATION,
          params: simulationRequest.toJson());

      return SimulationModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
