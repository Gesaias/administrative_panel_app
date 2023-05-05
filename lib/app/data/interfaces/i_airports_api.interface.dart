import '../models/airport.model.dart';

abstract class IAirportsApi {
  Future<List<AirportModel>> getAll();
  Future<int> alterStatus(int newStatus, int id, Map<String, dynamic> data);

  dynamic airportDecoder(dynamic map);
}
