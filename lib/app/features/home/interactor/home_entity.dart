import 'package:flutter/material.dart';
import 'package:poke_teste/app/features/home/data/Ihome_list_ds.dart';

class HomeEntity {
  TextEditingController searchBar = TextEditingController();
  List<Results> pokemons = [];
  bool loading = true;
  bool loadingButton = false;
  bool error = false;
  List<String> favorites = [];
  List<String> captured = [];
  int offset = 20;
}
