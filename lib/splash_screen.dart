import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_teste/app/domains/enums/storage_keys_enum.dart';
import 'package:poke_teste/app/services/local_storage/local_storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: const Color(0xFF173EA5),
      onEnd: () async {
        final localStorage = Modular.get<LocalStorageService>(
            defaultValue: LocalStorageService());
        await localStorage.startLocalStorageBox();
        if (localStorage.getFieldValue(StorageKeysEnum.isAuth) != null) {
          Modular.to.navigate('/home/');
        } else {
          Modular.to.navigate('/login/');
        }
      },
      childWidget: Center(
        child: Image.asset('assets/png/logo.png'),
      ),
    );
  }
}
