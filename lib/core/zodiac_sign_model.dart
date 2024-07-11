import 'dart:convert';

import 'helpers/enum.dart';

List<ZodiacSign> zodiacSignFromJson(String str) =>
    List<ZodiacSign>.from(json.decode(str).map((x) => ZodiacSign.fromJson(x)));

String zodiacSignToJson(List<ZodiacSign> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ZodiacSign {
  String name;
  String image;
  ElementType element;
  String symbol;
  String planet;
  ZodiacType zodiacType;

  ZodiacSign(
      {required this.name,
      required this.image,
      required this.element,
      required this.symbol,
      required this.planet,
      required this.zodiacType});

  factory ZodiacSign.fromJson(Map<String, dynamic> json) => ZodiacSign(
      name: json["name"],
      image: json["image"],
      element: json["element"],
      symbol: json["symbol"],
      planet: json["planet"],
      zodiacType: json["type"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "element": element,
        "symbol": symbol,
        "planet": planet,
        "type": zodiacType
      };
}
