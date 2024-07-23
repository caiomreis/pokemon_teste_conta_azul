import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_teste/app/domains/enums/storage_keys_enum.dart';
import 'package:poke_teste/app/features/login/interactor/login_entity.dart';
import 'package:poke_teste/app/services/local_storage/local_storage_service.dart';

class Logininteractor extends ValueNotifier<LoginEntity> {
  Logininteractor() : super(LoginEntity());
  final localStorage =
      Modular.get<LocalStorageService>(defaultValue: LocalStorageService());
  void setEmail(String text) {
    value.email = text;
  }

  void setPassword(String text) {
    value.password = text;
  }

  Future<void> login() async {
    if (value.email.isNotEmpty && value.password.isNotEmpty) {
      await localStorage.startLocalStorageBox();
      localStorage.setFieldValue(StorageKeysEnum.isAuth, 'true');

      Modular.to.navigate('/home/');
    }
  }

  Future<void> verifyLogin() async {
    await localStorage.startLocalStorageBox();

    if (localStorage.getFieldValue(StorageKeysEnum.isAuth) != null) {
      Modular.to.navigate('/home/');
    }
  }
}
