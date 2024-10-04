import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple/bloc/advanced/advanced_bloc.dart';
import 'package:flutter_bloc_simple/utils/utils.dart';
import 'package:flutter_bloc_simple/widgets/custom_floating_action_button.dart';

import 'package:flutter_bloc_simple/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_simple/widgets/custom_text.dart';

class DolphinScreen extends StatelessWidget {
  const DolphinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      customFloatingActionButton: [
        CustomFloatingActionButton(
          name: "SHOW",
          onPressed: () {
            context.read<AdvancedBloc>().add(AdvancedShowEvent());
          },
        ),
        CustomFloatingActionButton(
          name: "Add",
          onPressed: () {
            context.read<AdvancedBloc>().add(AdvancedAddEvent());
          },
        ),
        CustomFloatingActionButton(
          name: "Delete",
          onPressed: () {
            context.read<AdvancedBloc>().add(AdvancedDeleteEvent());
          },
        ),
      ],
      title: 'DolphinScreen | Advanced BLoC',
      children: [
        BlocConsumer<AdvancedBloc, AdvancedState>(
          listener: (context, state) {
            // todo: implement listener
            if (state is AdvancedErrorState) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: CustomText(
                    state.errorMessage ?? "Somethng went wrong!",
                    color: Colors.redAccent,
                  ),
                  content: const Text(
                    'Offendit eleifend moderatius ex vix, quem odio mazim et qui, purto expetendis cotidieque quo cu, veri persius vituperata ei nec. Vivendum intellegat et qui, ei denique consequuntur vix.',
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AdvancedLoadingState) {
              return const CircularProgressIndicator();
            }

            if (state is AdvancedErrorState) {
              return const CustomText(
                "Error Somthing weng wrong!",
                color: Colors.red,
              );
            }

            if (state is AdvancedHasDataState) {
              return Padding(
                padding: const EdgeInsets.all(38.0),
                child: Container(
                  color: Colors.grey,
                  child: CustomText(
                    "Response: ${state.message} \n_______\nStatus: ${state.status}",
                    color: randomColor(),
                  ),
                ),
              );
            }

            return const CustomText("Example BLoC");
          },
        ),
      ],
    );
  }
}
