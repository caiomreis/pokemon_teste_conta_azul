import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_value_notifier/flutter_value_notifier.dart';
import 'package:poke_teste/app/features/captured/interactor/captured_interceptor.dart';
import 'package:poke_teste/app/features/captured/ui/captured_page.dart';
import 'package:poke_teste/app/services/local_storage/local_storage_service.dart';

class CapturedModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => CapturednIteractor()),
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
            create: (_) => CapturednIteractor(),
            child: CapturedPage(
              capturedInteractor: Modular.get<CapturednIteractor>(),
            ),
          ),
        ),
      ];
}
