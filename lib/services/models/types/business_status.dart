// ignore: constant_identifier_names
enum BusinessStatus { OPERATIONAL, CLOSED_TEMPORARILY, CLOSED_PERMANENTLY }
final Map<String, BusinessStatus> businessStatusMapping = {
  "OPERATIONAL": BusinessStatus.OPERATIONAL,
  "CLOSED_TEMPORARILY": BusinessStatus.CLOSED_TEMPORARILY,
  "CLOSED_PERMANENTLY": BusinessStatus.CLOSED_PERMANENTLY
};
