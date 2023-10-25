import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/summary_model.dart';
import '../../domain/repositories/summary_repository.dart';

part 'summary_event.dart';
part 'summary_state.dart';
part 'summary_bloc.freezed.dart';

class SummaryBloc extends Bloc<SummaryEvent, SummaryState> {
  SummaryRepository summaryRepository;

  SummaryBloc({required this.summaryRepository})
      : super(const _StateInitial()) {
    on<SummaryEvent>((event, emit) async {
      emit(const _StateLoading());

      final result = await summaryRepository.getSummaries();
      result.fold(
        (message) => emit(_StateError(message)),
        (data) => emit(_StateLoaded(data)),
      );
    });
  }
}
