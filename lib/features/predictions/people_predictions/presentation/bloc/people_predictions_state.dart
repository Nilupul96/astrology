part of 'people_predictions_bloc.dart';

abstract class PeoplePredictionsState extends Equatable {
  const PeoplePredictionsState();

  @override
  List<Object> get props => [];
}

class PeoplePredictionsInitial extends PeoplePredictionsState {}

class PeoplePredictionsLoading extends PeoplePredictionsState {}

class PeoplePredictionsSuccess extends PeoplePredictionsState {
  final List<PersonalBehavior> behaviorsList;

  const PeoplePredictionsSuccess(this.behaviorsList);
}

class PeoplePredictionsError extends PeoplePredictionsState {
  final String error;

  const PeoplePredictionsError(this.error);
}
