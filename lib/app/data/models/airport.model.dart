import 'package:administrative_panel_app/app/modules/home/views/home.view.dart';

import '../enum/e_airports_status.enum.dart';
import 'city.model.dart';

class AirportModel {
  late int id;
  late String iata;
  late String lat;
  late String lon;
  late EAirportStatus status;
  String? descriptionStatus;
  late CityModel city;

  AirportModel({
    required this.id,
    required this.iata,
    required this.lat,
    required this.lon,
    required this.status,
    this.descriptionStatus,
    required this.city,
  });

  AirportModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    iata = json["iata"];
    lat = json["lat"];
    lon = json["lon"];
    status = setStatusAirport(json["status"]);
    descriptionStatus =json["description_status"] ?? "";
    city = CityModel.fromJson(json["city"]);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['id'] = id;
    data['iata'] = iata;
    data['lat'] = lat;
    data['lon'] = lon;
    data['status'] = status;
    data['description_status'] = descriptionStatus;
    data['city'] = city;

    return data;
  }
}

EAirportStatus setStatusAirport(int value) {
  switch (value) {
    case 0:
      return EAirportStatus.enabled;
    case 1:
      return EAirportStatus.disabled;
    default:
      return EAirportStatus.enabled;
  }
}
