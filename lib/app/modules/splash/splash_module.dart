import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/splash/splash_controller.dart';
import 'presentation/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [Bind.factory((i) => SplashController())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
      ];
}
