// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_teste/app/domains/enums/storage_keys_enum.dart';
import 'package:poke_teste/app/features/pokemons_details/data/Ipokemons_details_ds.dart';
import 'package:poke_teste/app/features/pokemons_details/data/pokemons_details_ds.dart';
import 'package:poke_teste/app/features/pokemons_details/interactor/pokemons_details_entity.dart';
import 'package:poke_teste/app/services/local_storage/local_storage_service.dart';

class PokemonDetailsnIteractor extends ValueNotifier<PokemonDetailsEntity> {
  PokemonDetailsnIteractor() : super(PokemonDetailsEntity());
  final pokemondetailsDs = Modular.get<PokemonDetailsListDataSource>(
    defaultValue: PokemonDetailsListDataSource(),
  );
  final localStorage = Modular.get<LocalStorageService>(
    defaultValue: LocalStorageService(),
  );

  Future<void> getPokemon(String name) async {
    value.loading = true;
    value.error = false;
    try {
      await localStorage.startLocalStorageBox();
      final IPokemonDetailsListDataSource data =
          await pokemondetailsDs.getPokemonList(name);
      value.pokemon_detail = data;
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

  void goToFavorite() {
    Modular.to.navigate('/favorite/');
  }

  void goToCaptured() {
    Modular.to.navigate('/captured/');
  }

  void backButton() {
    Modular.to.navigate('/home');
  }
}
