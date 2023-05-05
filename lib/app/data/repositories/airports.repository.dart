import '../models/airport.model.dart';
import '../providers/airports.provider.dart';

class AirportsRepository {
  AirportsProvider airportsProvider;

  AirportsRepository({required this.airportsProvider});

  Future<List<AirportModel>> getAll() async {
    return await airportsProvider.getAll();
  }

  Future<int> alterStatus(int newStatus, int id, Map<String, dynamic> description) async {
    return await airportsProvider.alterStatus(newStatus, id, description);
  }
}
