import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_challenge/app/modules/favorites/favorites_module.dart';
import 'package:ioasys_challenge/app/modules/poke_detail/poke_detail_module.dart';

import 'presentation/home/home_controller.dart';
import 'presentation/home/home_page.dart';

class HomeModule extends Module {
  static const routePokeDetail = 'poke-detail/';
  static const routeFavorites = 'favorites/';
  @override
  List<Bind> get binds => [Bind.factory((i) => HomeController())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ModuleRoute(routePokeDetail, module: PokeDetailModule()),
        ModuleRoute(routeFavorites, module: FavoritesModule()),
      ];
}
