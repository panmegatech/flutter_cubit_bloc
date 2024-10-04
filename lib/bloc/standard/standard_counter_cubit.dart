import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple/utils/utils.dart';

part 'standard_counter_state.dart';

class StandardCounterCubit extends Cubit<StandardCounterState> {
  StandardCounterCubit() : super(StandardCounterInitialState());

  Future<void> callAPI() async {
    emit(StandardCounterLoadingState());

    await Future.delayed(const Duration(milliseconds: 1800));
    final randomString = generateRandomString(8);
    return emit(StandardCounterHasDataState(
        message: "some data from API: \n\n $randomString"));
  }
}
