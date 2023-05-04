import 'package:administrative_panel_app/app/core/utils/getcolorfromhex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/themes/app_colors.dart';

class InfoLeftLoginWidget extends GetWidget {
  const InfoLeftLoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
        color: AppColors.kSecondaryColor,
      ),
      width: 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: Image.asset(
                    'images/logo.jpeg',
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Column(
                    children: [
                      Text(
                        'Amo',
                        style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        'Promo',
                        style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 175,
            child: Divider(
              color: AppColors.kPrimaryColor,
            ),
          ),
          SelectableText(
            'Painel Administrativo para Controle de Aeroportos',
            textAlign: TextAlign.center,
            style: GoogleFonts.sourceSansPro(
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColors.white,
            ),
          ),

          // Main
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectableText(
                    'Bem Vindo(a) de volta!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sourceSansPro(
                      decoration: TextDecoration.none,
                      fontSize: 24,
                      color: AppColors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: SelectableText(
                      'Nosso propósito é promover experiências inesquecíveis ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sourceSansPro(
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: getColorFromHex('006AB1'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: SelectableText(
                      'Somos apaixonados em desenvolver produtos e serviços que permitem aos nossos clientes viajar por um preço  justo, de forma segura e com as melhores parcerias',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SelectableText(
              '#DePromoVocêPode',
              textAlign: TextAlign.center,
              style: GoogleFonts.sourceSansPro(
                decoration: TextDecoration.none,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
