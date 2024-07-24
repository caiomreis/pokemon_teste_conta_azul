import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_teste/app/app_module.dart';
import 'package:poke_teste/app_widget.dart';

Future<void> main() async {
  appColorStart();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

void appColorStart() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}
