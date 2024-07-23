import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_value_notifier/flutter_value_notifier.dart';
import 'package:poke_teste/app/features/login/interactor/login_interceptor.dart';
import 'package:poke_teste/app/features/login/ui/login_page.dart';

import '../../services/local_storage/local_storage_service.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => Logininteractor()),
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
            create: (_) => Logininteractor(),
            child: LoginPage(
              loginInterceptor: Modular.get<Logininteractor>(),
            ),
          ),
        ),
      ];
}
