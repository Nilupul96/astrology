import 'package:astrology/core/network/net_result.dart';
import 'package:astrology/features/predictions/people_predictions/domain/repositories/behavior_prediction_repository.dart';
import '../datasources/behavior_predictions_datasource.dart';

class BehaviorPredictionsRepositoryImpl
    implements BehaviorPredictionRepository {
  final BehaviorPredictionDataSource behaviorPredictionDataSource;

  BehaviorPredictionsRepositoryImpl(this.behaviorPredictionDataSource);
  @override
  Future<Result> fetchPeopleBehaviors() async {
    return behaviorPredictionDataSource.fetchPeopleBehaviors();
  }
}
