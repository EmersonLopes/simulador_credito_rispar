import 'package:dio/dio.dart';
import 'package:simulador_credito_rispar/services/client_http_interface.dart';

class ClientHttpService implements IClientHttp {
  final _dio = Dio();

  @override
  Future get(String url) async {
    return await _dio.get(url);
  }

  @override
  Future post(String url, {params}) async {
    return await _dio.post(url, data: params);
  }
}
