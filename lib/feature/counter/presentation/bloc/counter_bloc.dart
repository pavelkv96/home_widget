import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home_widget/feature/counter/domain/repositories/counter_repository.dart';
import 'package:injectable/injectable.dart';

part 'counter_bloc.freezed.dart';

@immutable
@freezed
class CounterEvent {
  const CounterEvent._();

  const factory CounterEvent.fetchCurrentCount() = _FetchCurrentCountEvent;

  const factory CounterEvent.increment() = _IncrementCounterEvent;

  const factory CounterEvent.decrement() = _DecrementCounterEvent;
}

@immutable
@freezed
class CounterState with _$CounterState {
  const CounterState._();

  const factory CounterState.initial() = _InitialCounterState;

  const factory CounterState.loading() = _LoadingCounterState;

  const factory CounterState.value(int value) = _ValueCounterState;
}

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository repository;

  CounterBloc({required this.repository}) : super(const CounterState.initial()) {
    on<_FetchCurrentCountEvent>((event, emit) async {
      emit(const CounterState.loading());
      final result = await repository.fetchCurrentValue();
      emit(CounterState.value(result));
    });
    on<_IncrementCounterEvent>((event, emit) async {
      emit(const CounterState.loading());
      final value = await repository.fetchCurrentValue() + 1;
      final result = await repository.setNewValue(value);
      if (result) emit(CounterState.value(value));
    });
    on<_DecrementCounterEvent>((event, emit) async {
      emit(const CounterState.loading());
      final value = await repository.fetchCurrentValue() - 1;
      final result = await repository.setNewValue(value);
      if (result) emit(CounterState.value(value));
    });
  }
}
