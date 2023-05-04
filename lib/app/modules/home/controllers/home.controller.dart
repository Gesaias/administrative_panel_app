import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

class HomeController extends GetxController {
  HomeController();

  Debouncer debouncer = Debouncer(delay: const Duration(milliseconds: 500));

  RxString searchQuery = ''.obs;
  RxBool isSearchOpen = false.obs;

  void setSearchQuery(String query) {
    print('pesquisando...');
    searchQuery.value = query;
  }
}
