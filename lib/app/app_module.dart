import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_teste/app/features/captured/captured_module.dart';
import 'package:poke_teste/app/features/favorite/favorite_module.dart';
import 'package:poke_teste/app/features/login/login_module.dart';
import 'package:poke_teste/app/features/pokemons_details/pokemon_details_module.dart';
import 'package:poke_teste/app/services/local_storage/local_storage_service.dart';

import 'features/home/home_module.dart';

class AppModule extends Module {
  AppModule();

  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => {
            LocalStorageService(),
          },
          export: true,
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/favorite', module: FavoriteModule()),
        ModuleRoute('/captured', module: CapturedModule()),
        ModuleRoute('/pokemon_details', module: PokemonDetailsModule()),
      ];
}
