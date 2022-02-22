import 'package:flutter/material.dart';

class AppBarDetail extends StatelessWidget {
  final String name;
  final String id;
  const AppBarDetail({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 24),
          ),
          Text(
            '#$id',
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
