import 'package:flutter/material.dart';
import 'package:flutter_bloc_simple/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_simple/widgets/custom_text.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: "Cat Screen",
      children: [
        CustomText("Cat"),
      ],
    );
  }
}
