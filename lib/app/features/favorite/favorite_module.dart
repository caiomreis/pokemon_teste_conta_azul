import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_value_notifier/flutter_value_notifier.dart';
import 'package:poke_teste/app/features/favorite/interactor/favorite_interceptor.dart';
import 'package:poke_teste/app/features/favorite/ui/favorite_page.dart';
import 'package:poke_teste/app/services/local_storage/local_storage_service.dart';

class FavoriteModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => FavoritenIteractor()),
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
          '/',
          child: (context, args) => ValueNotifierProvider(
            create: (_) => FavoritenIteractor(),
            child: FavoritePage(
              favoriteInteractor: Modular.get<FavoritenIteractor>(),
            ),
          ),
        ),
      ];
}
