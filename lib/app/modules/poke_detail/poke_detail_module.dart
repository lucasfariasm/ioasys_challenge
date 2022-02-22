import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/home_detail/poke_detail_controller.dart';
import 'presentation/home_detail/poke_detail_page.dart';

class PokeDetailModule extends Module {
  @override
  List<Bind> get binds => [Bind.factory((i) => PokeDetailController())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => PokeDetailPage(
            id: args.data['id'],
            name: args.data['name'],
            image: args.data['image'],
            type: args.data['type'],
          ),
        ),
      ];
}
