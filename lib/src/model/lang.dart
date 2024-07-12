import 'package:house_of_tomorrow/util/helper/intl_helper.dart';

class Lang {
  final String ko;
  final String en;

  const Lang({
    required this.en,
    required this.ko,
  });

  factory Lang.fromJson(Map<String, dynamic> json) {
    return Lang(
      en: json['en'] ?? '',
      ko: json['ko'] ?? '',
    );
  }
  @override
  String toString() => IntlHelper.isKo ? ko : en;
}
