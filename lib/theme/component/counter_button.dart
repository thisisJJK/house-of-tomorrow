import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/asset_icon.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({
    super.key,
    required this.count,
    required this.onChanged,
  });
  final int count;
  final void Function(int count) onChanged;

  @override
  Widget build(BuildContext context) {
    bool isMinusActive = count > 1;
    return Wrap(
      spacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (!isMinusActive) return;
            onChanged(count - 1);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: context.color.surface,
              boxShadow: isMinusActive ? context.deco.shadow : null,
            ),
            padding: const EdgeInsets.all(8),
            child: AssetIcon(
              'minus',
              color: isMinusActive ? context.color.primary : null,
            ),
          ),
        ),
        Text(
          '$count',
          style: context.typo.headline4.copyWith(
            fontWeight: context.typo.semiBold,
          ),
        ),
        GestureDetector(
          onTap: () {
            onChanged(count + 1);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: context.color.surface,
              boxShadow: context.deco.shadow,
            ),
            padding: const EdgeInsets.all(8),
            child: AssetIcon(
              'plus',
              color: context.color.primary,
            ),
          ),
        ),
      ],
    );
  }
}
