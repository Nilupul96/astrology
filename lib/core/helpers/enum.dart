// ignore_for_file: constant_identifier_names

enum TextFieldType { NORMAL, EMAIL, PASSWORD, PHONENUMBER, OPTIONAL, ZIPCODE }

enum ElementType { EARTH, FIRE, AIR, WATER }

extension ElementTypeExtension on ElementType {
  String get displayName {
    switch (this) {
      case ElementType.EARTH:
        return "Earth";
      case ElementType.AIR:
        return "Air";
      case ElementType.WATER:
        return "Water";
      case ElementType.FIRE:
        return "Fire";
      default:
        return "";
    }
  }
}

enum ZodiacType {
  ARIES,
  TAURUS,
  GEMINI,
  CANCER,
  LEO,
  VIRGO,
  LIBRA,
  SCORPIO,
  SAGITTARIUS,
  CAPRICORN,
  AQUARIUS,
  PISCES
}
