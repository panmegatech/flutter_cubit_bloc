import 'package:flutter/material.dart';

import 'package:flutter_bloc_simple/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_simple/widgets/custom_text.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      title: 'Hotel Screen',
      children: [
        CustomText("Hotel Screen"),
      ],
    );
  }
}
