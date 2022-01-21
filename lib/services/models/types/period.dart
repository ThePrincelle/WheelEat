class Period {
  // Object definition of Period

  final String? close;
  final String? open;

  const Period({
    this.close,
    this.open,
  });

  // ToString debug method
  @override
  String toString() {
    return 'Period{close: $close, open: $open}';
  }

  // FromJson parser
  factory Period.fromJson(Map<String, dynamic> json) {
    return Period(
      close: json['close']?.toString() ?? '',
      open: json['open']?.toString() ?? '',
    );
  }
}
