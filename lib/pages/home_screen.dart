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
        child: const CustomText(
          "Ant : Basic Cubit",
          color: Colors.teal,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          log("pushBee!");
          Navigator.pushNamed(context, RouteName.bee);
        },
        child: const CustomText(
          "Bee : Simple Cubit",
          color: Colors.orange,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          log("pushCat!");
          Navigator.pushNamed(context, RouteName.cat);
        },
        child: const CustomText(
          "Cat: Standard Cubit",
          color: Colors.indigo,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          log("dolphin push!");
          Navigator.pushNamed(context, RouteName.dolphin);
        },
        child: const CustomText(
          "dolphin: Advanced BLoC",
          color: Colors.pink,
        ),
      ),
    ]);
  }
}
