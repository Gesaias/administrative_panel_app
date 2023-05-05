import 'package:administrative_panel_app/app/data/enum/e_airports_status.enum.dart';
import 'package:get/get.dart';

import '../../core/utils/constants.dart';
import '../api/exceptions/rest_exception.dart';
import '../interfaces/i_airports_api.interface.dart';
import '../models/airport.model.dart';
import '../services/rest_client.service.dart';

class AirportsProvider implements IAirportsApi {
  RestClientService restClientService;

  AirportsProvider({required this.restClientService});

  @override
  airportDecoder(map) {
    if (map is Map<String, dynamic>) return AirportModel.fromJson(map);
    if (map is List) {
      return map.map((item) => AirportModel.fromJson(item)).toList();
    }
  }

  @override
  Future<List<AirportModel>> getAll() async {
    Response<dynamic> response = await restClientService.find(
      EndPoints.airport,
    );

    if (response.hasError) {
      throw RestException(
        status: response.statusCode ?? 500,
        msg: response.statusText ?? "Não capturado!",
      );
    }

    return airportDecoder(response.body);
  }

  @override
  Future<int> alterStatus(int newStatus, int id, Map<String, dynamic> data) async {
    Response<dynamic> response = await restClientService.insert(
      '${EndPoints.airportAlterStatus}${id.toString()}/${newStatus.toString()}',
      body: data,
    );

    if (response.hasError) {
      throw RestException(
        status: response.statusCode ?? 500,
        msg: response.statusText ?? "Não capturado!",
      );
    }

    return response.body["status"];
  }
}
