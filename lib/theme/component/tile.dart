import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/asset_icon.dart';

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  final String icon;
  final String title;
  final String subtitle;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            AssetIcon(icon),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Text(
                title,
                style: context.typo.headline5,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              subtitle,
              style: context.typo.subtitle1.copyWith(
                color: context.color.primary,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const AssetIcon('chevron-right'),
          ],
        ),
      ),
    );
  }
}
