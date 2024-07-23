import 'package:poke_teste/app/features/pokemons_details/data/Ipokemons_details_ds.dart';
import 'package:poke_teste/app/repository/poke_teste_http.dart';

class PokemonDetailsListDataSource extends PokeTesteHttpRepository {
  Future<IPokemonDetailsListDataSource> getPokemonList(String name) async {
    final response = await get('https://pokeapi.co/api/v2/pokemon/$name/');
    IPokemonDetailsListDataSource data =
        IPokemonDetailsListDataSource.fromJson(response);
    return data;
  }
}
