import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Color color;
  final bool themeDarkIsActive;
  const CustomAppBar({
    Key? key,
    required this.color,
    required this.themeDarkIsActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/images/logo_ioasys_mini.png'),
        Text(
          'ioasys pokédex',
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Switch(value: false, onChanged: (value) {}),
      ],
    );
  }
}
