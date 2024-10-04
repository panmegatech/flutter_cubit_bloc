import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_simple/route_name.dart';
import 'package:flutter_bloc_simple/widgets/custom_scaffold.dart';
import 'package:flutter_bloc_simple/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(title: "Home Screen | BLoC Example", children: [
      ElevatedButton(
        onPressed: () {
          log("pushAnt!");
          Navigator.pushNamed(context, RouteName.ant);
        },
        child: const CustomText("Push Ant"),
      ),
      ElevatedButton(
        onPressed: () {
          log("pushBee!");
          Navigator.pushNamed(context, RouteName.bee);
        },
        child: const CustomText("Push Bee"),
      ),
      ElevatedButton(
        onPressed: () {
          log("pushCat!");
          Navigator.pushNamed(context, RouteName.cat);
        },
        child: const CustomText("Push Cat"),
      ),
      ElevatedButton(
        onPressed: () {
          log("dolphin push!");
          Navigator.pushNamed(context, RouteName.dolphin);
        },
        child: const CustomText("Push dolphin"),
      ),
    ]);
  }
}
