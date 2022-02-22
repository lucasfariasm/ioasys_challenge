import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_challenge/app/modules/home/home_module.dart';
import 'package:ioasys_challenge/app/modules/home/presentation/home/widgets/search_input_text.dart';
import 'package:ioasys_challenge/shared/theme/app_theme.dart';
import 'package:ioasys_challenge/shared/widgets/app_bar.dart';
import 'package:ioasys_challenge/shared/widgets/pokemon_grid.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final colors = AppTheme.colors;
  bool themeDarkIsActive = false;

  @override
  void initState() {
    controller.searchedPokeController.addListener(_searchedControllerListener);
    controller.getPokes();
    super.initState();
  }

  void _searchedControllerListener() {
    if (controller.searchedPokeController.text.isEmpty &&
        controller.allPokes.length == 1) {
      controller.getPokes();
    }
  }

  @override
  void dispose() {
    controller.searchedPokeController
        .removeListener(_searchedControllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(color: colors.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  CustomAppBar(
                    color: colors.primary,
                    themeDarkIsActive: themeDarkIsActive,
                  ),
                  const SizedBox(height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SearchInputText(
                          icon: Icons.search,
                          controller: controller.searchedPokeController,
                          onTapIcon: () {
                            FocusScope.of(context).unfocus();
                            controller.getSearchedPoke();
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Modular.to.pushNamed(HomeModule.routeFavorites);
                        },
                        child: Icon(
                          Icons.favorite,
                          color: colors.primary,
                        ),
                      )
                    ],
                  ),
                  Observer(
                    builder: (_) {
                      return controller.allPokes.isNotEmpty
                          ? controller.allPokes[0].name != 'fake'
                              ? CustomScrollView(
                                  shrinkWrap: true,
                                  primary: false,
                                  slivers: <Widget>[
                                    PokemonGrid(pokemon: controller.allPokes),
                                  ],
                                )
                              : Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 50),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Ops',
                                          style: TextStyle(
                                            fontSize: 80,
                                            color: colors.subGray,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Este pokemon não está aqui ;(',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: colors.subGray,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                          : const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 100),
                                child: CircularProgressIndicator(),
                              ),
                            );
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
