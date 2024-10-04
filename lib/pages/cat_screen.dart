import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple/bloc/standard/standard_counter_cubit.dart';
import 'package:flutter_bloc_simple/utils/utils.dart';
import 'package:flutter_bloc_simple/widgets/custom_floating_action_button.dart';
import 'package:flutter_bloc_simple/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_simple/widgets/custom_text.dart';

class MooDeng extends Equatable {
  final int data;
  const MooDeng(this.data);

  @override
  List<Object?> get props => [
        data,
      ];
}

class CatScreen extends StatelessWidget {
  const CatScreen({super.key});

  final MooDeng a = const MooDeng(123);
  final MooDeng b = const MooDeng(123);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Cat Screen | Standard Cubit",
      customFloatingActionButton: [
        CustomFloatingActionButton(
          name: "API",
          onPressed: () {
            log("call API by standard counter Cubit");
            context.read<StandardCounterCubit>().callAPI();
          },
        ),
      ],
      children: [
        CustomText(
          "MooDeng A:B isEqual: ${a == b}",
          color: Colors.red,
        ),
        BlocBuilder<StandardCounterCubit, StandardCounterState>(
          builder: (context, state) {
            if (state is StandardCounterLoadingState) {
              return CircularProgressIndicator(
                color: randomColor(),
              );
            }

            if (state is StandardCounterHasDataState) {
              return CustomText(state.message);
            }

            return const CustomText("StandardCounterCubit");
          },
        ),
      ],
    );
  }
}
