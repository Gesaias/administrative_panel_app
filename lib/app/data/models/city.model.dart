class CityModel {
  late int id;
  late String name;
  late String state;

  CityModel({required this.id, required this.name, required this.state});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    state = json["state"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['state'] = state;

    return data;
  }
}
