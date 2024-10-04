part of 'advanced_bloc.dart';

sealed class AdvancedEvent extends Equatable {
  const AdvancedEvent();

  @override
  List<Object> get props => [];
}

class AdvancedShowEvent extends AdvancedEvent {}

class AdvancedAddEvent extends AdvancedEvent {}

class AdvancedUpdateEvent extends AdvancedEvent {}

class AdvancedDeleteEvent extends AdvancedEvent {}
