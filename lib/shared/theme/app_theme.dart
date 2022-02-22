import 'app_colors.dart';

class AppTheme {
  static final AppTheme instance = AppTheme();
  final _colors = AppColors();

  static AppColors get colors => instance._colors;
}
