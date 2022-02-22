import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ioasys_challenge/app/modules/home/home_module.dart';
import 'package:ioasys_challenge/shared/theme/app_theme.dart';
import 'package:ioasys_challenge/shared/utils/ui_helper.dart';

class PokemonCard extends StatelessWidget {
  final String id;
  final String image;
  final String name;
  final String type;

  const PokemonCard({
    Key? key,
    required this.id,
    required this.image,
    required this.name,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var colors = AppTheme.colors;
    return InkWell(
      onTap: () {
        Modular.to.pushNamed(HomeModule.routePokeDetail, arguments: {
          'id': id,
          'name': name,
          'image': image,
          'type': type,
        });
      },
      child: Hero(
        tag: id,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: UIHelper.getColorFromType(type),
              width: 2,
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        '#$id',
                        style: TextStyle(
                          fontSize: 8,
                          color: UIHelper.getColorFromType(type),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                        child: Image.network(image, fit: BoxFit.contain)),
                  ),
                  Container(
                    height: 20,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: UIHelper.getColorFromType(type),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 10,
                          color: AppTheme.colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
