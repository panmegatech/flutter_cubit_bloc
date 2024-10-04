import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple/bloc/basic/basic_counter_cubit.dart';
import 'package:flutter_bloc_simple/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_simple/widgets/custom_text.dart';

class AntScreen extends StatefulWidget {
  const AntScreen({super.key});

  @override
  State<AntScreen> createState() => _AntScreenState();
}

class _AntScreenState extends State<AntScreen> {
  int localState = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Ant Screen",
      children: [
        BlocBuilder<BasicCounterCubit, int>(
          builder: (context, state) {
            return CustomText("Counter Cubit Example: $state");
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  log("call Counter increment event");
                  context.read<BasicCounterCubit>().increment();
                },
                child: const CustomText(
                  "Cubit(+)",
                  color: Colors.teal,
                )),
            ElevatedButton(
                onPressed: () {
                  log("call Counter decrement event");
                  context.read<BasicCounterCubit>().decrement();
                },
                child: const CustomText(
                  "Cubit(-)",
                  color: Colors.red,
                )),
          ],
        ),
        ElevatedButton(
            onPressed: () {
              log("call localState: $localState ");
              setState(() {
                localState++;
              });
            },
            child: CustomText(
              "localState: $localState",
              color: Colors.blue,
            )),
      ],
    );
  }
}
