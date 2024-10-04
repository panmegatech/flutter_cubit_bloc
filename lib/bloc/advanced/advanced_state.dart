part of 'advanced_bloc.dart';

sealed class AdvancedState extends Equatable {
  const AdvancedState();

  @override
  List<Object?> get props => [];
}

final class AdvancedInitialState extends AdvancedState {}

final class AdvancedLoadingState extends AdvancedState {}

final class AdvancedErrorState extends AdvancedState {
  final String? errorMessage;

  const AdvancedErrorState({this.errorMessage});

  @override
  List<Object?> get props => [
        errorMessage,
      ];
}

final class AdvancedHasDataState extends AdvancedState {
  final String message;
  final bool? status;

  const AdvancedHasDataState({required this.message, this.status});

  @override
  List<Object?> get props => [
        message,
        status,
      ];
}
