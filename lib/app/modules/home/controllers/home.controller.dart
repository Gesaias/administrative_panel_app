import 'package:administrative_panel_app/app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/widgets/app_alert/snackbar_widget.dart';
import '../../../data/api/exceptions/rest_exception.dart';
import '../../../data/enum/e_airports_status.enum.dart';
import '../../../data/models/airport.model.dart';
import '../../../data/repositories/airports.repository.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  AirportsRepository airportsRepository;

  HomeController({required this.airportsRepository});

  SnackbarAlertWidget alert = SnackbarAlertWidget();

  final RxBool _isLoading = false.obs;

  final RxList<AirportModel> _airports = <AirportModel>[].obs;

  TextEditingController descriptionController = TextEditingController();

  // Getters

  List<AirportModel> get airports => _airports.value;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() async {
    super.onInit();
    await _getAllAirports();
  }

  Future<void> alterOptionsOnSelected({
    required String value,
    required int id,
    required int index,
  }) async {
    if (value.runtimeType == String && value == 'description') {
      return Get.defaultDialog(
        content: SizedBox(
          width: 400,
          child: TextField(
            enabled: false,
            maxLength: 150,
            maxLines: 4,
            decoration: InputDecoration(
                hintText: _airports.value[index].descriptionStatus),
          ),
        ),
        actions: [
          SizedBox(
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimaryColor,
              ),
              onPressed: () => Get.back(),
              child: Text(
                'Ok',
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (int.parse(value) == EAirportStatus.disabled.value) {
      return Get.defaultDialog(
        content: SizedBox(
          width: 400,
          child: TextField(
            controller: descriptionController,
            maxLength: 150,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: 'Description...',
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
              ),
              onPressed: () async {
                await airportsRepository.alterStatus(
                  int.parse(value),
                  id,
                  {
                    "description": descriptionController.text.trim(),
                  },
                ).then((int status) async {
                  await _getAllAirports();
                  Get.back();
                });
              },
              child: Text(
                'Save',
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
              ),
              onPressed: () => Get.back(),
              child: Text(
                'Cancel',
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      await airportsRepository.alterStatus(
        int.parse(value),
        id,
        {
          "description": "",
        },
      ).then((int status) async {
        await _getAllAirports();
      });
    }
  }

  Future<void> _getAllAirports() async {
    _setIsLoading();

    await airportsRepository.getAll().then((List<AirportModel> value) {
      _airports.value = value;

      _setIsLoading();
    }).catchError((error) {
      _setIsLoading();

      if (error.runtimeType == RestException) {
        RestException e = error as RestException;

        if (e.status == 401) {
          Get.offAllNamed(Routes.LOGIN);
        } else if (e.status == 404) {
          _airports.value = [];
        } else {
          alert.alertError(
            title: 'An unexpected error occurred',
            description: 'Please reload the page to try again..',
          );
        }
      }
    });
  }

  void _setIsLoading() => _isLoading.value = !_isLoading.value;
}
