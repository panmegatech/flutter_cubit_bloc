import 'package:flutter_bloc/flutter_bloc.dart';

//! Cubit
class SimpleCounterCubit extends Cubit<SimpleCounterState> {
  SimpleCounterCubit() : super(SimpleCounterInitailState(0));

  Future<void> increment() async {
    emit(SimpleCounterLoadingState(state.count, message: state.message));

    await Future.delayed(const Duration(milliseconds: 1800));

    return emit(
      SimpleCounterLoadedState(
        state.count + 1,
        message: "increment simple!",
      ),
    );
  }

  void decrement() => emit(
        SimpleCounterLoadedState(state.count - 1,
            message: "decrement simple!",
            otherMesage: "This is a simple counter decrement"),
      );
}

//! Mutiple State
abstract class SimpleCounterState {
  final int count;
  final String? message;

  SimpleCounterState(this.count, {this.message});
}

class SimpleCounterInitailState extends SimpleCounterState {
  SimpleCounterInitailState(super.count);
}

class SimpleCounterLoadingState extends SimpleCounterState {
  SimpleCounterLoadingState(super.count, {super.message});
}

class SimpleCounterLoadedState extends SimpleCounterState {
  final String? otherMesage;
  SimpleCounterLoadedState(
    super.count, {
    super.message,
    this.otherMesage,
  });
}
