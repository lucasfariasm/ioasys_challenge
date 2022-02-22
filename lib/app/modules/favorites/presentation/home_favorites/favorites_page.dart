import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_challenge/shared/theme/app_theme.dart';
import 'package:ioasys_challenge/shared/widgets/app_bar.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final colors = AppTheme.colors;

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
                    themeDarkIsActive: true,
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: colors.primary,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Meus favoritos',
                        style: TextStyle(
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
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
                            'Esta tela ainda não existe ;(',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: colors.subGray,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 100),
                          GestureDetector(
                            onTap: () {
                              Modular.to.pop();
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: colors.primary,
                                ),
                                Text(
                                  'Voltar',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: colors.subGray,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
