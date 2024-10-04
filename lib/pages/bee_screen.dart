import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple/bloc/simple_counter_cubit.dart';
import 'package:flutter_bloc_simple/utils/utils.dart';
import 'package:flutter_bloc_simple/widgets/custom_floating_action_button.dart';
import 'package:flutter_bloc_simple/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_simple/widgets/custom_text.dart';

class BeeScreen extends StatelessWidget {
  const BeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Bee Screen",
      customFloatingActionButton: [
        CustomFloatingActionButton(
          name: "+",
          onPressed: () {
            log("pressed : +");
            context.read<SimpleCounterCubit>().increment();
          },
        ),
        CustomFloatingActionButton(
          name: "-",
          onPressed: () {
            log("pressed: -");
            context.read<SimpleCounterCubit>().decrement();
          },
        ),
      ],
      children: [
        BlocBuilder<SimpleCounterCubit, SimpleCounterState>(
          builder: (context, state) {
            if (state is SimpleCounterLoadedState) {
              return Column(
                children: [
                  CustomText("Simple Counter (count): ${state.count}"),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    "( ${state.message} )",
                    color: randomColor(),
                  ),
                ],
              );
            }

            if (state is SimpleCounterLoadingState) {
              return const CircularProgressIndicator();
            }

            return const Text("Press floating button to update the counter");
          },
        ),
      ],
    );
  }
}
