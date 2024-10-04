import 'package:flutter/material.dart';

import 'package:flutter_bloc_simple/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_simple/widgets/custom_text.dart';

class PizzaScreen extends StatelessWidget {
  const PizzaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Pizza Screen',
      children: [
        CustomText("Advanced BLoC Example"),
      ],
    );
  }
}
