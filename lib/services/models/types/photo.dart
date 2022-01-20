import 'package:flutter_dotenv/flutter_dotenv.dart';

final googleApiKey = dotenv.env['GOOGLE_API_KEY'] ?? '';

class Photo {
  final int height;
  final List<dynamic>? htmlAttributions;
  final String? photoReference;
  final int width;
  final Uri? uri;

  const Photo(
      {this.height = 0,
      this.htmlAttributions,
      this.photoReference = "",
      this.width = 0,
      this.uri});

  // ToString debug method
  @override
  String toString() {
    return 'Photo{height: $height, htmlAttributions: $htmlAttributions, photoReference: $photoReference, width: $width, uri: ${uri.toString()}}';
  }

  // FromJson parser
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
        height: json['height'],
        htmlAttributions: json['html_attributions'] != null
            ? json['html_attributions']
            : null,
        photoReference: json['photo_reference'],
        width: json['width'],

        // https://maps.googleapis.com/maps/api/place/photo?maxwidth=1000&photo_reference=photo_reference&key=YOUR_API_KEY
        uri: json['photo_reference'] != null
            ? Uri.https("maps.googleapis.com", "maps/api/place/photo", {
                "photo_reference": json['photo_reference'],
                "maxwidth": "1000",
                "key": googleApiKey
              })
            : null);
  }
}
