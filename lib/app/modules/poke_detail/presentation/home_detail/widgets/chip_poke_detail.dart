import 'package:flutter/material.dart';

import 'package:ioasys_challenge/app/modules/poke_detail/service/model/poke_detail_model.dart';
import 'package:ioasys_challenge/shared/utils/ui_helper.dart';

class ChipPokeDetail extends StatelessWidget {
  final Types type;
  const ChipPokeDetail({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: UIHelper.getColorFromType(type.type!.name.toString()),
      label: Text(
        type.type!.name.toString(),
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
