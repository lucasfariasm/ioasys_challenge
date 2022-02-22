import 'package:flutter/material.dart';

import 'package:ioasys_challenge/shared/utils/ui_helper.dart';

class ProgressStatsDetail extends StatelessWidget {
  final String textStat;
  final String type;
  final int valueStat;
  const ProgressStatsDetail({
    Key? key,
    required this.textStat,
    required this.type,
    required this.valueStat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              textStat,
              style: TextStyle(
                color: UIHelper.getColorFromType(type),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          VerticalDivider(
            thickness: 2,
            indent: 5,
            endIndent: 4,
            color: UIHelper.getColorFromType(type).withOpacity(.3),
          ),
          Expanded(
            flex: 1,
            child: valueStat.toString().length == 2
                ? Text(
                    '0${valueStat.toString()}',
                  )
                : Text(
                    valueStat.toString(),
                  ),
          ),
          Expanded(
            flex: 5,
            child: SizedBox(
              width: double.maxFinite,
              height: 5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: LinearProgressIndicator(
                  value: valueStat.toDouble() / 150,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    UIHelper.getColorFromType(type),
                  ),
                  backgroundColor:
                      UIHelper.getColorFromType(type).withOpacity(.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
