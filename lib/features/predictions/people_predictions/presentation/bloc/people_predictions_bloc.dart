import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'people_predictions_event.dart';
part 'people_predictions_state.dart';

class PeoplePredictionsBloc extends Bloc<PeoplePredictionsEvent, PeoplePredictionsState> {
  PeoplePredictionsBloc() : super(PeoplePredictionsInitial()) {
    on<PeoplePredictionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
