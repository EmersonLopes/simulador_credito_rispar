import 'package:simulador_credito_rispar/models/simulation_request.dart';
import 'package:simulador_credito_rispar/repositories/simulation_repository_interface.dart';
import 'package:simulador_credito_rispar/services/client_http_interface.dart';

import '../utils/constants.dart';

class SimulationRepository implements ISimulationRepository {
  final IClientHttp clientHttp;

  SimulationRepository(this.clientHttp);

  Map<String, String> headers = {
    "Content-Type": "application/json",
    //"Authorization": 'Bearer $token'
  };

  @override
  Future postSimulation(SimulationRequest simulationRequest) async {
    try {
      final response = await clientHttp.post(Constants.URL_SIMULATION,
          params: simulationRequest.toJson());

      return response?.data;
      //return Supply.fromJson(response?.data);
    } catch (e) {
      rethrow;
    }
  }
}
