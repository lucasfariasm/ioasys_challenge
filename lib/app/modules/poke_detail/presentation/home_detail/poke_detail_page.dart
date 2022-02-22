import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:math' as math;

import 'package:ioasys_challenge/app/modules/poke_detail/presentation/home_detail/widgets/app_bar_detail.dart';
import 'package:ioasys_challenge/app/modules/poke_detail/presentation/home_detail/widgets/chip_poke_detail.dart';
import 'package:ioasys_challenge/app/modules/poke_detail/presentation/home_detail/widgets/progress_stats_detail.dart';
import 'package:ioasys_challenge/shared/theme/app_theme.dart';
import 'package:ioasys_challenge/shared/utils/ui_helper.dart';

import 'poke_detail_controller.dart';

class PokeDetailPage extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  final String type;

  const PokeDetailPage({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  }) : super(key: key);

  @override
  State<PokeDetailPage> createState() => _PokeDetailPageState();
}

class _PokeDetailPageState
    extends ModularState<PokeDetailPage, PokeDetailController> {
  final colors = AppTheme.colors;

  @override
  void initState() {
    controller.getPokeDetail(name: widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: UIHelper.getColorFromType(widget.type),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBarDetail(
          id: widget.id,
          name: widget.name,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Image.asset(
                  'assets/images/pokeball.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Observer(
              builder: (_) => Padding(
                padding: const EdgeInsets.only(
                  top: 200.0,
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: controller.pokeDetail.types != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Observer(
                                  builder: (_) {
                                    return Icon(
                                      controller.isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: colors.primary,
                                      size: 30,
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(22),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: controller.pokeDetail.types!
                                            .map(
                                              (type) => Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: ChipPokeDetail(
                                                  type: type,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(Icons
                                                    .monitor_weight_outlined),
                                                Text(
                                                  '${controller.pokeDetail.weight.toString()} kg ',
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Weight',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: colors.subGray,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Transform.rotate(
                                                  angle: 90 * math.pi / 180,
                                                  child: const Icon(
                                                      Icons.straighten),
                                                ),
                                                Text(
                                                  '${controller.pokeDetail.height.toString()} m ',
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Height',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: colors.subGray,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Text(
                                                '${controller.pokeDetail.moves![0]} / ${controller.pokeDetail.moves![1]}',
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                'Moves',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: colors.subGray,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      controller.pokeDetail.flavorText
                                          .toString(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Text(
                                          'Base Stats',
                                          style: TextStyle(
                                            color: UIHelper.getColorFromType(
                                                widget.type),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    ProgressStatsDetail(
                                      textStat: 'HP',
                                      type: widget.type,
                                      valueStat: controller
                                          .pokeDetail.stats![0].baseStat!,
                                    ),
                                    ProgressStatsDetail(
                                      textStat: 'ATK',
                                      type: widget.type,
                                      valueStat: controller
                                          .pokeDetail.stats![1].baseStat!,
                                    ),
                                    ProgressStatsDetail(
                                      textStat: 'DEF',
                                      type: widget.type,
                                      valueStat: controller
                                          .pokeDetail.stats![2].baseStat!,
                                    ),
                                    ProgressStatsDetail(
                                      textStat: 'SATK',
                                      type: widget.type,
                                      valueStat: controller
                                          .pokeDetail.stats![3].baseStat!,
                                    ),
                                    ProgressStatsDetail(
                                      textStat: 'SDEF',
                                      type: widget.type,
                                      valueStat: controller
                                          .pokeDetail.stats![4].baseStat!,
                                    ),
                                    ProgressStatsDetail(
                                      textStat: 'SPD',
                                      type: widget.type,
                                      valueStat: controller
                                          .pokeDetail.stats![5].baseStat!,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 100),
                            child: CircularProgressIndicator(
                              color: UIHelper.getColorFromType(widget.type),
                            ),
                          ),
                        ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Hero(
                  tag: widget.image,
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.network(widget.image),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
