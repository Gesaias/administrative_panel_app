import 'package:get/get.dart';

import '../../data/providers/airports.provider.dart';
import '../../data/repositories/airports.repository.dart';
import '../../data/services/rest_client.service.dart';
import 'controllers/home.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        airportsRepository: AirportsRepository(
          airportsProvider: AirportsProvider(
            restClientService: Get.find<RestClientService>(),
          ),
        ),
      ),
    );
  }
}
