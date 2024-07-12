part of 'button.dart';

enum ButtonType {
  fill,
  outline,
  flat,
  ;

//텍스트 & 아이콘 컬러
  Color getColor(
    BuildContext context,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? context.color.onInactiveContainer
            : color ?? context.color.onPrimary;
      case ButtonType.flat:
      case ButtonType.outline:
        return isInactive
            ? context.color.inactive
            : color ?? context.color.primary;
    }
  }

  Color getBackgroundColor(
    BuildContext context,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
        return isInactive
            ? context.color.inactiveContainer
            : color ?? context.color.primary;
      case ButtonType.outline:
      case ButtonType.flat:
        return color ?? Colors.transparent;
    }
  }

  Border? getBorder(
    BuildContext context,
    bool isInactive, [
    Color? color,
  ]) {
    switch (this) {
      case ButtonType.fill:
      case ButtonType.flat:
        return null;
      case ButtonType.outline:
        return Border.all(
          color: getColor(context, isInactive, color),
        );
    }
  }
}
