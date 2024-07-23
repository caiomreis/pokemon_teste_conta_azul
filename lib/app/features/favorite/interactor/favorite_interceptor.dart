// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_teste/app/domains/enums/storage_keys_enum.dart';
import 'package:poke_teste/app/features/favorite/interactor/favorite_entity.dart';
import 'package:poke_teste/app/services/local_storage/local_storage_service.dart';

class FavoritenIteractor extends ValueNotifier<IFavoriteEntity> {
  FavoritenIteractor() : super(IFavoriteEntity());

  final localStorage = Modular.get<LocalStorageService>(
    defaultValue: LocalStorageService(),
  );

  Future<void> getList() async {
    value.loading = true;
    value.error = false;
    try {
      await localStorage.startLocalStorageBox();

      List<String> favoritesList = localStorage.getFieldValueAsDynamic(
            StorageKeysEnum.favorites,
          ) ??
          [];
      for (var el in favoritesList) {
        value.favorites.add(el);
      }
      List<String> capturedList = localStorage.getFieldValueAsDynamic(
            StorageKeysEnum.captured,
          ) ??
          [];
      for (var el in capturedList) {
        value.captured.add(el);
      }
    } catch (e) {
      value.error = true;
    } finally {
      value.loading = false;
      notifyListeners();
    }
  }

  Future<void> addFavorite(String text) async {
    value.favorites.add(text);
    await localStorage.startLocalStorageBox();
    localStorage.setFieldValueAsDynamic(
      StorageKeysEnum.favorites,
      value.favorites,
    );

    notifyListeners();
  }

  Future<void> removeFavorite(String text) async {
    value.favorites.remove(text);
    await localStorage.startLocalStorageBox();
    localStorage.setFieldValueAsDynamic(
      StorageKeysEnum.favorites,
      value.favorites,
    );

    notifyListeners();
  }

  Future<void> addCaptured(String text) async {
    value.captured.add(text);
    await localStorage.startLocalStorageBox();
    localStorage.setFieldValueAsDynamic(
      StorageKeysEnum.captured,
      value.captured,
    );
    notifyListeners();
  }

  Future<void> removeCaptured(String text) async {
    value.captured.remove(text);
    await localStorage.startLocalStorageBox();
    localStorage.setFieldValueAsDynamic(
      StorageKeysEnum.captured,
      value.captured,
    );
    notifyListeners();
  }

  void goToHome() {
    Modular.to.navigate('/home/');
  }

  void goToCaptured() {
    Modular.to.navigate('/captured/');
  }
}
