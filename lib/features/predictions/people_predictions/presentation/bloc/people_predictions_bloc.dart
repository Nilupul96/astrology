import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/network/net_result.dart';
import '../../domain/entities/personal_behavior.dart';
import '../../domain/usecases/fetch_behavior_predictions_usecase.dart';
part 'people_predictions_event.dart';
part 'people_predictions_state.dart';

class PeoplePredictionsBloc
    extends Bloc<PeoplePredictionsEvent, PeoplePredictionsState> {
  final FetchBehaviorPredictionsUseCase fetchBehaviorPredictionsUseCase;

  PeoplePredictionsBloc(this.fetchBehaviorPredictionsUseCase)
      : super(PeoplePredictionsInitial()) {
    on<FetchPeopleBehaviorsList>(_fetchPeopleBehaviorsList);
  }

  void _fetchPeopleBehaviorsList(FetchPeopleBehaviorsList event,
      Emitter<PeoplePredictionsState> emit) async {
    emit(PeoplePredictionsLoading());
    Result result = await fetchBehaviorPredictionsUseCase.call();
    if (result.exception != null) {
      emit(PeoplePredictionsError(result.exception!.message ?? ''));
    }
    if (result.exception == null) {
      emit(PeoplePredictionsSuccess(result.result));
    }
  }
}
