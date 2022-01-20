import 'dart:convert';

double? parseDouble(String? value) {
  if (value == null) {
    return null;
  }
  return double.parse(value);
}

int? parseInt(String? value) {
  if (value == null) {
    return null;
  }
  return int.parse(value);
}
