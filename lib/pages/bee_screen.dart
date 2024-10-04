import 'package:flutter/material.dart';
import 'package:flutter_bloc_simple/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_simple/widgets/custom_text.dart';

class BeeScreen extends StatelessWidget {
  const BeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: "Bee Screen",
      children: [
        CustomText("Bee Screen"),
      ],
    );
  }
}
