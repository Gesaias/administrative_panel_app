class Authenticate {
  late String token;

  Authenticate({required this.token});

  Authenticate.fromJson(Map<String, dynamic> json) {
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
