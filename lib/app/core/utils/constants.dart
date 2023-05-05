import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  Constants._();
}

class EndPoints {
  EndPoints._();

  static String apiV1 = dotenv.env["API_URL"]!;
  static const Duration timeout = Duration(seconds: 30);

  static String login = 'auth/login';

  static String user = 'user/';
  static String userToken = '${user}token';

  static String airport = 'airport/';
  static String airportAlterStatus = '${airport}alter_status/';
}
