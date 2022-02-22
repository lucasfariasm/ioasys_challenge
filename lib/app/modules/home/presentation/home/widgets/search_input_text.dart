import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import 'package:ioasys_challenge/shared/theme/app_theme.dart';

class SearchInputText extends StatelessWidget {
  final IconData icon;
  final Function() onTapIcon;
  final TextEditingController controller;

  const SearchInputText({
    Key? key,
    required this.icon,
    required this.onTapIcon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = AppTheme.colors;
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 40),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colors.primary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: 'search_pokemon'.i18n(),
        hintStyle: TextStyle(
          fontSize: 13,
          color: colors.mediumGray,
        ),
        labelText: 'search'.i18n(),
        labelStyle: TextStyle(
            color: colors.primary, fontSize: 18, fontWeight: FontWeight.w500),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 25),
          child: GestureDetector(
            onTap: onTapIcon,
            child: Icon(
              icon,
              color: colors.primary,
            ),
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
