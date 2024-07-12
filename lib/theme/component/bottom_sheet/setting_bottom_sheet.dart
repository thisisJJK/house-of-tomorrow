import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/lang_service.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/bottom_sheet/base_bottom_sheet.dart';
import 'package:house_of_tomorrow/theme/component/tile.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';
import 'package:provider/provider.dart';

class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = context.appTheme.brightness == Brightness.light;
    final LangService langService = context.watch();
    return BaseBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Tile(
            icon: isLightTheme ? 'sunny' : 'moon',
            title: S.current.theme,
            subtitle: isLightTheme ? S.current.light : S.current.dark,
            onPressed: context.read<ThemeService>().toggleTheme,
          ),
          Tile(
            icon: 'language',
            title: S.current.language,
            subtitle: IntlHelper.isKo ? S.current.ko : S.current.en,
            onPressed: langService.toggleLang,
          )
        ],
      ),
    );
  }
}
