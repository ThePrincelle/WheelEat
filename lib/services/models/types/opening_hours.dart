import './period.dart';

class OpeningHours {
  // Object definition of OpeningHours

  final bool openNow;
  final List<Period>? periods;
  final List<String>? weekdayText;

  const OpeningHours({
    this.openNow = true,
    this.periods,
    this.weekdayText,
  });

  // ToString debug method
  @override
  String toString() {
    return 'OpeningHours{openNow: $openNow, periods: $periods, weekdayText: $weekdayText}';
  }

  // FromJson parser
  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(
      openNow: json['open_now'] ?? true,
      periods: json['periods'] != null
          ? (json['periods'] as List).map((e) => Period.fromJson(e)).toList()
          : null,
      weekdayText: json['weekday_text'] != null
          ? (json['weekday_text'] as List).cast<String>()
          : null,
    );
  }
}
