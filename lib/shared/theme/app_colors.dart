import 'package:flutter/material.dart';

abstract class IAppColors {
  Color get primary;
  Color get background;
  Color get white;
  Color get lightGray;
  Color get subGray;
  Color get mediumGray;
  Color get darkGray;
  Color get rock;
  Color get ghost;
  Color get steel;
  Color get water;
  Color get grass;
  Color get psychic;
  Color get ice;
  Color get dark;
  Color get fairy;
  Color get normal;
  Color get fighting;
  Color get flying;
  Color get poison;
  Color get ground;
  Color get bug;
  Color get fire;
  Color get eletric;
  Color get dragon;
}

class AppColors implements IAppColors {
  @override
  Color get primary => const Color(0XFFEC0344);

  @override
  Color get background => const Color(0XFFF7F7F7);
  @override
  Color get white => const Color(0XFFFFFFFF);
  @override
  Color get lightGray => const Color(0XFFE0E0E0);
  @override
  Color get subGray => const Color(0XFFB2B2B2);
  @override
  Color get mediumGray => const Color(0XFF666666);
  @override
  Color get darkGray => const Color(0XFF212121);

  @override
  Color get rock => const Color(0XFFB69E31);
  @override
  Color get ghost => const Color(0XFF70559B);
  @override
  Color get steel => const Color(0XFFB7B9D0);
  @override
  Color get water => const Color(0XFF6493EB);
  @override
  Color get grass => const Color(0XFF74CB48);
  @override
  Color get psychic => const Color(0XFFFB5584);
  @override
  Color get ice => const Color(0XFF9AD6DF);
  @override
  Color get dark => const Color(0XFF75574C);
  @override
  Color get fairy => const Color(0XFFE69EAC);
  @override
  Color get normal => const Color(0XFFAAA67F);
  @override
  Color get fighting => const Color(0XFFC12239);
  @override
  Color get flying => const Color(0XFFA891EC);
  @override
  Color get poison => const Color(0XFFA43E9E);
  @override
  Color get ground => const Color(0XFFDEC16B);
  @override
  Color get bug => const Color(0XFFA7B723);
  @override
  Color get fire => const Color(0XFFF57D31);
  @override
  Color get eletric => const Color(0XFFF9CF30);
  @override
  Color get dragon => const Color(0XFF7037FF);
}
