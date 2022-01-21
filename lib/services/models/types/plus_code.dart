class PlusCode {
  final String compoundCode;
  final String globalCode;

  const PlusCode({
    this.compoundCode = "",
    this.globalCode = "",
  });

  // ToString debug method
  @override
  String toString() {
    return 'PlusCode{compoundCode: $compoundCode, globalCode: $globalCode}';
  }

  // FromJson parser
  factory PlusCode.fromJson(Map<String, dynamic> json) {
    return PlusCode(
      compoundCode: json['compound_code'],
      globalCode: json['global_code'],
    );
  }
}
