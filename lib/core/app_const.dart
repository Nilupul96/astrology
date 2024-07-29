import 'package:astrology/core/app_assets.dart';
import 'package:astrology/features/predictions/people_predictions/presentation/pages/zodiac_list_screen.dart';

import 'helpers/enum.dart';
import 'zodiac_sign_model.dart';

class AppConst {
  static List<ZodiacSign> zodiacSignList = List<ZodiacSign>.from(
      ZODIAC_SIGN_LIST.map((x) => ZodiacSign.fromJson(x)));
  static List<Map<String, dynamic>> ZODIAC_SIGN_LIST = [
    {
      "name": "Aries",
      "image": AppAssets.aries,
      "element": ElementType.FIRE,
      "symbol": "Ram",
      "planet": "Mars",
      'type': ZodiacType.ARIES
    },
    {
      "name": "Taurus",
      "image": AppAssets.taurus,
      "element": ElementType.EARTH,
      "symbol": "Ram",
      "planet": "Venus",
      'type': ZodiacType.TAURUS
    },
    {
      "name": "Gemini",
      "image": AppAssets.gemini,
      "element": ElementType.AIR,
      "symbol": "Twins",
      "planet": "Mercury",
      'type': ZodiacType.GEMINI
    },
    {
      "name": "Cancer",
      "image": AppAssets.cancer,
      "element": ElementType.WATER,
      "symbol": "Crab",
      "planet": "Moon",
      'type': ZodiacType.CANCER
    },
    {
      "name": "Leo",
      "image": AppAssets.leo,
      "element": ElementType.FIRE,
      "symbol": "Lion",
      "planet": "Sun",
      'type': ZodiacType.LEO
    },
    {
      "name": "Virgo",
      "image": AppAssets.virgo,
      "element": ElementType.EARTH,
      "symbol": "Virgin",
      "planet": "Mercury",
      'type': ZodiacType.VIRGO
    },
    {
      "name": "Libra",
      "image": AppAssets.libra,
      "element": ElementType.AIR,
      "symbol": "Scales",
      "planet": "Venus",
      'type': ZodiacType.LIBRA
    },
    {
      "name": "Scorpio",
      "image": AppAssets.scorpio,
      "element": ElementType.WATER,
      "symbol": "Scorpion",
      "planet": "Pluto",
      'type': ZodiacType.SCORPIO
    },
    {
      "name": "Sagittarius",
      "image": AppAssets.sagittarius,
      "element": ElementType.FIRE,
      "symbol": "Archer",
      "planet": "Jupiter",
      'type': ZodiacType.SAGITTARIUS
    },
    {
      "name": "Capricorn",
      "image": AppAssets.capricorn,
      "element": ElementType.EARTH,
      "symbol": "Goat",
      "planet": "Saturn",
      'type': ZodiacType.CAPRICORN
    },
    {
      "name": "Aquarius",
      "image": AppAssets.aquarius,
      "element": ElementType.AIR,
      "symbol": "Water Bearer",
      "planet": "Uranus",
      'type': ZodiacType.AQUARIUS
    },
    {
      "name": "Pisces",
      "image": AppAssets.pisces,
      "element": ElementType.WATER,
      "symbol": "Fish",
      "planet": "Neptune",
      'type': ZodiacType.PISCES
    }
  ];
  static List<String> HOROSCOPE_OPTION_LIST = [
    'Today',
    'Tomorrow',
    'Week',
    'Month'
  ];
  static List<Map<String, dynamic>> PREDICTIONS_MENU_LIST = [
    {
      "name": "Human Behavior",
      "image": AppAssets.aries,
      "route": ZodiacSignListScreen.routeName
    },
    // {
    //   "name": "Taurus",
    //   "image": AppAssets.taurus,
    // }
  ];
}
