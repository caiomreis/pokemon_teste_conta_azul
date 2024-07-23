import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:poke_teste/app/app_module.dart';
import 'package:poke_teste/start_app.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  appColorStart();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
  FlutterNativeSplash.remove();
}

void appColorStart() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}
