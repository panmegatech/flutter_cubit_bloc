part of 'standard_counter_cubit.dart';

sealed class StandardCounterState extends Equatable {}

final class StandardCounterInitialState extends StandardCounterState {
  @override
  List<Object?> get props => [];
}

final class StandardCounterLoadingState extends StandardCounterState {
  @override
  List<Object?> get props => [];
}

final class StandardCounterHasDataState extends StandardCounterState {
  final String message;

  StandardCounterHasDataState({required this.message});

  @override
  List<Object?> get props => [
        message,
      ];
}
