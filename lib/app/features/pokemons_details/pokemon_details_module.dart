import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_value_notifier/flutter_value_notifier.dart';
import 'package:poke_teste/app/features/pokemons_details/interactor/pokemons_details_interceptor.dart';
import 'package:poke_teste/app/features/pokemons_details/ui/pokemon_details_page.dart';

import '../../services/local_storage/local_storage_service.dart';

class PokemonDetailsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => PokemonDetailsnIteractor()),
        Bind.factory(
          (i) => {
            LocalStorageService(),
          },
          export: true,
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/:name',
          child: (context, args) => ValueNotifierProvider(
            create: (_) => PokemonDetailsnIteractor(),
            child: PokemonDetailsPage(
              pokemondetailsInteractor: Modular.get<PokemonDetailsnIteractor>(),
              name: args.params['name'],
            ),
          ),
        ),
      ];
}
