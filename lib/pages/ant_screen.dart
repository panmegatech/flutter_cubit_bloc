import 'package:flutter/material.dart';
import 'package:flutter_bloc_simple/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_simple/widgets/custom_text.dart';

class AntScreen extends StatelessWidget {
  const AntScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: "Ant Screen",
      children: [
        CustomText("Ant"),
      ],
    );
  }
}
