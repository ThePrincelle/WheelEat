class OpeningHours {
  // Object definition of OpeningHours

  final bool openNow;
  final List<String>? weekdayText;

  const OpeningHours({
    this.openNow = true,
    this.weekdayText,
  });

  // ToString debug method
  @override
  String toString() {
    return 'OpeningHours{openNow: $openNow, weekdayText: $weekdayText}';
  }

  // FromJson parser
  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(
      openNow: json['open_now'] ?? true,
      weekdayText: json['weekday_text'] != null
          ? (json['weekday_text'] as List).cast<String>()
          : null,
    );
  }
}
