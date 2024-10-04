import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple/utils/utils.dart';

part 'advanced_event.dart';
part 'advanced_state.dart';

class AdvancedBloc extends Bloc<AdvancedEvent, AdvancedState> {
  AdvancedBloc() : super(AdvancedInitialState()) {
    on<AdvancedShowEvent>((event, emit) async {
      //todo handle logic such as call usecase , API etc.
      emit(AdvancedLoadingState());
      await Future.delayed(const Duration(milliseconds: 1800));
      // final responseStatus = randomBoolean();
      // log("Response status: $responseStatus");
      // if (!responseStatus) {
      //   return emit(AdvancedErrorState());
      // }

      return emit(
        AdvancedHasDataState(
          message: "example data from usecase ${randomString(8)}",
          status: true,
        ),
      );
    });

    on<AdvancedAddEvent>(
      (event, emit) async {
        //todo handle: [Add] Event
        emit(AdvancedLoadingState());
        await Future.delayed(const Duration(milliseconds: 1800));
        final responseStatus = randomBoolean();
        log("Response status: $responseStatus");
        if (!responseStatus) {
          return emit(
              const AdvancedErrorState(errorMessage: "add data error!"));
        }

        return emit(
          AdvancedHasDataState(
            message: "Add success: ${randomString(8)}",
            status: responseStatus,
          ),
        );
      },
    );

    on<AdvancedUpdateEvent>(
      (event, emit) {
        //todo handle: [Update] Event
      },
    );

    on<AdvancedDeleteEvent>(
      (event, emit) async {
        //todo handle: [Delete] Event
        emit(AdvancedLoadingState());
        await Future.delayed(const Duration(milliseconds: 1800));
        final responseStatus = randomBoolean();
        log("Response status: $responseStatus");
        if (!responseStatus) {
          return emit(const AdvancedErrorState(errorMessage: "Delete fail!"));
        }

        return emit(
          AdvancedHasDataState(
            message: "delete success",
            status: responseStatus,
          ),
        );
      },
    );
  }
}
