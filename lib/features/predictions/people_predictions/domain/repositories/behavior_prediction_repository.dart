import '../../../../../core/network/net_result.dart';

abstract class BehaviorPredictionRepository {
  Future<Result> fetchPeopleBehaviors();
}
