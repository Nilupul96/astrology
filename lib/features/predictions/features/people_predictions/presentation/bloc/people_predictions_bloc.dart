import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../people_predictions/presentation/bloc/people_predictions_bloc.dart';

class PeoplePredictionsBloc
    extends Bloc<PeoplePredictionsEvent, PeoplePredictionsState> {
  PeoplePredictionsBloc() : super(PeoplePredictionsInitial()) {
    on<PeoplePredictionsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
