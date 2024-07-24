// ignore_for_file: camel_case_types

import 'package:poke_teste/app/style/app_colors_abstract.dart';
import 'package:flutter/services.dart';

class _AppColorsThemeBase implements AppColorsTheme {
  @override
  AppColorsTheme copyWith({
    AppColors? red,
    AppColors? pink,
    AppColors? blue,
    AppColors? green,
    AppColors? gray,
    AppBasicColors? neutral,
    AppColorStatus? status,
  }) {
    return copyWith(
      red: red,
      pink: pink,
      blue: blue,
      green: green,
      gray: gray,
      neutral: neutral,
      status: status,
    );
  }

  @override
  AppColors get blue => const AppColors(
        light: Color(0x264383F5),
        base: Color(0xFF4484F5),
        medium: Color(0xFF4484F5),
        strong: Color(0xFF4484F5),
      );

  @override
  AppColors get gray => const AppColors(
        light: Color(0xFFF8F9FA),
        base: Color(0xFF858E96),
        medium: Color(0xFF4F4F4F),
        strong: Color(0xFF212529),
      );

  @override
  AppColors get green => const AppColors(
        light: Color(0xFF495057),
        base: Color(0xFF4CD4A8),
        medium: Color(0xFF4CD4A8),
        strong: Color(0xFF4CD4A8),
      );

  @override
  AppColors get red => const AppColors(
        light: Color(0xFF495057),
        base: Color(0xFFff0000),
        medium: Color(0xFFff0000),
        strong: Color(0xFFff0000),
      );

  @override
  AppColors get pink => const AppColors(
        light: Color(0xFFF8F9FA),
        base: Color(0xFFFFF5F5),
        medium: Color(0xFFF8E2E2),
        strong: Color(0xFFF8E2E2),
      );

  @override
  AppBasicColors get neutral => const AppBasicColors(
        white: Color(0xFFFFFFFF),
        black: Color(0xFF212529),
      );

  @override
  AppColorStatus get status => const AppColorStatus(
        success: Color(0xFF28F282),
        error: Color(0xFFFF7456),
        info: Color(0xFF5393FF),
        waring: Color(0xFFF9C43A),
      );
}

extension AppColorsExtension on AppColorsTheme {
  SystemUiOverlayStyle get systemUiOverlayStyle {
    return SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Poke_Teste_Colors.theme.pink.base,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Poke_Teste_Colors.theme.neutral.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  }
}

class Poke_Teste_Colors {
  static final AppColorsTheme theme = _AppColorsThemeBase();
}
