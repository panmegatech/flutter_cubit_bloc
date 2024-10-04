import 'package:flutter_bloc/flutter_bloc.dart';

class BasicCounterCubit extends Cubit<int> {
  BasicCounterCubit() : super(0);

  void increment() {
    return emit(state + 1);
  }

  void decrement() => emit(state - 1);
}
