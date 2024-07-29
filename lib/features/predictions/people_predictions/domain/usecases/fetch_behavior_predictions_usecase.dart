import 'package:astrology/features/predictions/people_predictions/domain/repositories/behavior_prediction_repository.dart';
import '../../../../../core/network/net_result.dart';
import '../../../../../core/usecase/usecase.dart';

class FetchBehaviorPredictionsUseCase implements UseCase<Result, void> {
  final BehaviorPredictionRepository behaviorPredictionRepository;

  FetchBehaviorPredictionsUseCase(this.behaviorPredictionRepository);
  @override
  Future<Result> call({void params}) async {
    return behaviorPredictionRepository.fetchPeopleBehaviors();
  }
}
