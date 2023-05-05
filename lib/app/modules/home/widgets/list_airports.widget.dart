import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/themes/app_colors.dart';
import '../../../data/enum/e_airports_status.enum.dart';
import '../controllers/home.controller.dart';

class ListAirportsWidget extends GetWidget<HomeController> {
  const ListAirportsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        constraints: const BoxConstraints(maxWidth: 500, minWidth: 200),
        child: ListView.builder(
          itemCount: controller.airports.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0),
              child: Card(
                color: AppColors.kPrimaryColor,
                child: ListTile(
                  leading: SelectableText(
                    controller.airports[index].status == EAirportStatus.enabled
                        ? 'Enabled'
                        : 'Disabled',
                    style: GoogleFonts.sourceSansPro(
                      color: Colors.white,
                    ),
                  ),
                  title: SelectableText(
                    '${controller.airports[index].iata} | ${controller.airports[index].city.name}/${controller.airports[index].city.state}',
                    style: GoogleFonts.sourceSansPro(
                      color: Colors.white,
                    ),
                  ),
                  trailing: PopupMenuButton<String>(
                    tooltip: 'Options',
                    itemBuilder: (context) => <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        enabled: controller.airports[index].status ==
                            EAirportStatus.disabled,
                        value: EAirportStatus.enabled.value.toString(),
                        child: Center(
                          child: SizedBox(
                            width: 110,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.done_rounded,
                                  color: Colors.green[700],
                                ),
                                const VerticalDivider(
                                  width: 8.0,
                                  color: Colors.transparent,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      'Activate',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        enabled: controller.airports[index].status ==
                            EAirportStatus.enabled,
                        value: EAirportStatus.disabled.value.toString(),
                        child: Center(
                          child: SizedBox(
                            width: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.block_rounded,
                                  color: Colors.red[700],
                                ),
                                const VerticalDivider(
                                  width: 8.0,
                                  color: Colors.transparent,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      'Inactivate',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        enabled: controller.airports[index].status ==
                            EAirportStatus.disabled,
                        value: 'description',
                        child: Center(
                          child: SizedBox(
                            width: 114,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.info_rounded,
                                  color: AppColors.kPrimaryColor,
                                ),
                                const VerticalDivider(
                                  width: 8.0,
                                  color: Colors.transparent,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      'Description',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.sourceSansPro(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      color: AppColors.kSecondaryColor,
                    ),
                    onSelected: (value) => controller.alterOptionsOnSelected(
                      value: value,
                      id: controller.airports[index].id,
                      index: index,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
