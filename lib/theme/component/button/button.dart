import 'package:flutter/material.dart';
import 'package:house_of_tomorrow/src/service/theme_service.dart';
import 'package:house_of_tomorrow/theme/component/asset_icon.dart';

part 'button_size.dart';
part 'button_type.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    required this.onPressed,
    ButtonType? type,
    ButtonSize? size,
    bool? isInactive,
    this.text,
    this.icon,
    this.width,
    this.color,
    this.backgroundColor,
    this.borderColor,
  })  : type = type ?? ButtonType.fill,
        size = size ?? ButtonSize.medium,
        isInactive = isInactive ?? false;

  final void Function() onPressed;

  final ButtonType type;
  final ButtonSize size;

  final bool isInactive;

  final String? text;
  final String? icon;

  final double? width;

  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  //버튼 클릭 여부
  bool isPressed = false;
  //버튼 비활성화 여부
  bool get isInactive => isPressed || widget.isInactive;

  Color get color => widget.type.getColor(
        context,
        isInactive,
        widget.color,
      );
  Color get backgroundColor => widget.type.getBackgroundColor(
        context,
        isInactive,
        widget.backgroundColor,
      );
  Border? get border => widget.type.getBorder(
        context,
        isInactive,
        widget.borderColor,
      );

  void onPressed(bool newIsPressed) {
    if (isPressed == newIsPressed) return;
    setState(() {
      isPressed = newIsPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        onPressed(false);
        if (!widget.isInactive) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => onPressed(true),
      onTapCancel: () => onPressed(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: border,
        ),
        padding: EdgeInsets.all(widget.size.padding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null)
              AssetIcon(
                widget.icon!,
                color: color,
              ),
            if (widget.icon != null && widget.text != null)
              const SizedBox(width: 8),
            if (widget.text != null)
              Text(
                widget.text!,
                style: widget.size.getTextStyle(context).copyWith(
                      color: color,
                      fontWeight: context.typo.semiBold,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
