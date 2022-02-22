import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/home_favorites/favorites_page.dart';

class FavoritesModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const FavoritesPage()),
      ];
}
