import 'package:administrative_panel_app/app/app.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/data/services/storage.service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await dotenv.load(fileName: ".env");

  initializeDateFormatting('pt_BR', null);
  Intl.defaultLocale = 'pt_BR';

  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());

  runApp(const AppWidget());
}
