import 'dart:ui';

abstract class AppColorsBase {
  Color get light;
  Color get base;
  Color get medium;
  Color get strong;
  AppColorsBase copyWith({
    Color? light,
    Color? base,
    Color? medium,
    Color? strong,
  });
}

abstract class AppBasicColorsBase {
  Color get white;
  Color get black;
  AppBasicColorsBase copyWith({
    Color? white,
    Color? black,
  });
}

abstract class AppBasicColorStatus {
  Color get success;
  Color get error;
  Color get info;
  Color get waring;
  AppBasicColorStatus copyWith({
    Color? success,
    Color? error,
    Color? info,
    Color? waring,
  });
}

abstract class AppColorsTheme {
  AppColors get red;
  AppColors get pink;
  AppColors get blue;
  AppColors get green;
  AppColors get gray;
  AppBasicColors get neutral;
  AppBasicColorStatus get status;
  AppColorsTheme copyWith({
    AppColors? red,
    AppColors? pink,
    AppColors? blue,
    AppColors? green,
    AppColors? gray,
    AppBasicColors? neutral,
    AppColorStatus? status,
  });
}

class AppColors implements AppColorsBase {
  @override
  final Color light;
  @override
  final Color base;
  @override
  final Color medium;
  @override
  final Color strong;

  const AppColors({
    required this.light,
    required this.base,
    required this.medium,
    required this.strong,
  });

  @override
  AppColorsBase copyWith({
    Color? light,
    Color? base,
    Color? medium,
    Color? strong,
  }) {
    return AppColors(
      light: light ?? this.light,
      base: base ?? this.base,
      medium: medium ?? this.medium,
      strong: strong ?? this.strong,
    );
  }
}

class AppBasicColors implements AppBasicColorsBase {
  @override
  final Color white;
  @override
  final Color black;

  const AppBasicColors({
    required this.white,
    required this.black,
  });

  AppBasicColorsBase copyWith({
    Color? white,
    Color? black,
  }) {
    return AppBasicColors(
      white: white ?? this.white,
      black: black ?? this.black,
    );
  }
}

class AppColorStatus implements AppBasicColorStatus {
  @override
  final Color success;
  @override
  final Color error;
  @override
  final Color info;
  @override
  final Color waring;
  const AppColorStatus({
    required this.success,
    required this.error,
    required this.info,
    required this.waring,
  });

  AppBasicColorStatus copyWith({
    Color? success,
    Color? error,
    Color? info,
    Color? waring,
  }) {
    return AppColorStatus(
      success: success ?? this.success,
      error: error ?? this.error,
      info: info ?? this.info,
      waring: waring ?? this.waring,
    );
  }
}
