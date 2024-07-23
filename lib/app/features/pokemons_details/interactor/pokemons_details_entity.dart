// ignore_for_file: non_constant_identifier_names

import 'package:poke_teste/app/features/pokemons_details/data/Ipokemons_details_ds.dart';

class PokemonDetailsEntity {
  IPokemonDetailsListDataSource pokemon_detail =
      IPokemonDetailsListDataSource();
  bool loading = true;
  bool loadingButton = false;
  bool error = false;
  List<String> favorites = [];
  List<String> captured = [];
  int offset = 20;
}
