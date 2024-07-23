import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_value_notifier/flutter_value_notifier.dart';
import 'package:poke_teste/app/features/home/interactor/home_interceptor.dart';
import 'package:poke_teste/app/features/home/ui/home_page.dart';

import '../../services/local_storage/local_storage_service.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomenIteractor()),
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
            create: (_) => HomenIteractor(),
            child: HomePage(
              homeInteractor: Modular.get<HomenIteractor>(),
            ),
          ),
        ),
      ];
}
