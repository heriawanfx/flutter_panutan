part of 'summary_bloc.dart';

@freezed
class SummaryState with _$SummaryState {
  const factory SummaryState.initial() = _StateInitial;
  const factory SummaryState.loading() = _StateLoading;
  const factory SummaryState.loaded(List<SummaryModel> data) = _StateLoaded;
  const factory SummaryState.error(String message) = _StateError;
}
