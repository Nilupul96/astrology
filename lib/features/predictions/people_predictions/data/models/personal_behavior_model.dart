import 'package:astrology/features/predictions/people_predictions/domain/entities/personal_behavior.dart';

class PeopleBehaviorModel extends PersonalBehavior {
  PeopleBehaviorModel(
      {required super.name, required super.general, required super.data});

  factory PeopleBehaviorModel.fromJson(Map<String, dynamic> json) {
    return PeopleBehaviorModel(
        name: json['name'], general: json['general'], data: json['data']);
  }
}
