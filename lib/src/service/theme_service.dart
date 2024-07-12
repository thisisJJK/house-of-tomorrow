import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/theme/dark_theme.dart';
import 'package:house_of_tomorrow/theme/foundation/app_theme.dart';
import 'package:house_of_tomorrow/theme/light_theme.dart';
import 'package:provider/provider.dart';

class ThemeService with ChangeNotifier {
  ThemeService({
    AppTheme? appTheme,
  }) : appTheme = appTheme ?? LightTheme();

  AppTheme appTheme;

  void toggleTheme() {
    if (appTheme.brightness == Brightness.light) {
      appTheme = DarkTheme();
    } else {
      appTheme = LightTheme();
    }
    notifyListeners();
  }

  /// Material ThemeData 커스텀
  ThemeData get themeData {
    return ThemeData(

        /// Scaffold
        scaffoldBackgroundColor: appTheme.color.surface,

        /// AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: appTheme.color.surface,
          elevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: appTheme.color.text,
          ),
          titleTextStyle: appTheme.typo.headline2.copyWith(
            color: appTheme.color.text,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ));
  }
}

extension ThemeServiceExt on BuildContext {
  ThemeService get themeService => watch<ThemeService>();
  AppTheme get appTheme => themeService.appTheme;
  AppColor get color => appTheme.color;
  AppDeco get deco => appTheme.deco;
  AppTypo get typo => appTheme.typo;
}
