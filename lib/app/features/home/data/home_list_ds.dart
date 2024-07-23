import 'package:poke_teste/app/features/home/data/Ihome_list_ds.dart';
import 'package:poke_teste/app/repository/poke_teste_http.dart';

class HomeListDataSource extends PokeTesteHttpRepository {
  Future<IHomeListDataSource> getPokemonList() async {
    final response = await get('https://pokeapi.co/api/v2/pokemon?limit=20');
    IHomeListDataSource data = IHomeListDataSource.fromJson(response);
    return data;
  }

  Future<IHomeListDataSource> getPaginatePokemonList(int offset) async {
    final response =
        await get('https://pokeapi.co/api/v2/pokemon?limit=20&offset=$offset');
    IHomeListDataSource data = IHomeListDataSource.fromJson(response);
    return data;
  }
}
