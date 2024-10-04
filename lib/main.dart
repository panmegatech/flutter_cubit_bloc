import 'package:flutter/material.dart';
import 'package:flutter_bloc_simple/pages/ant_screen.dart';
import 'package:flutter_bloc_simple/pages/bee_screen.dart';
import 'package:flutter_bloc_simple/pages/cat_screen.dart';
import 'package:flutter_bloc_simple/pages/home_screen.dart';
import 'package:flutter_bloc_simple/route_name.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RouteName.home: (_) => const HomeScreen(),
        RouteName.ant: (_) => const AntScreen(),
        RouteName.bee: (_) => const BeeScreen(),
        RouteName.cat: (_) => const CatScreen(),
      },
      initialRoute: RouteName.home,
    );
  }
}
