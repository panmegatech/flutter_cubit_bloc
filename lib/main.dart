import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple/bloc/basic/basic_counter_cubit.dart';
import 'package:flutter_bloc_simple/bloc/simple/simple_counter_cubit.dart';
import 'package:flutter_bloc_simple/bloc/standard/standard_counter_cubit.dart';
import 'package:flutter_bloc_simple/pages/ant_screen.dart';
import 'package:flutter_bloc_simple/pages/bee_screen.dart';
import 'package:flutter_bloc_simple/pages/cat_screen.dart';
import 'package:flutter_bloc_simple/pages/home_screen.dart';
import 'package:flutter_bloc_simple/pages/hotel_screen.dart';
import 'package:flutter_bloc_simple/pages/pizza_screen.dart';
import 'package:flutter_bloc_simple/route_name.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => BasicCounterCubit()),
    BlocProvider(create: (_) => SimpleCounterCubit()),
    BlocProvider(create: (_) => StandardCounterCubit()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RouteName.ant: (_) => const AntScreen(),
        RouteName.bee: (_) => const BeeScreen(),
        RouteName.cat: (_) => const CatScreen(),
      },
      initialRoute: RouteName.home,
      onGenerateRoute: (settings) {
        final String? routeName = settings.name;
        final PageRoute pageRoute;

        switch (routeName) {
          case RouteName.pizza:
            //todo handle advanced BLoC
            pageRoute = MaterialPageRoute(
              builder: (context) => const PizzaScreen(),
            );
            break;
          case RouteName.hotel:
            pageRoute = MaterialPageRoute(
              builder: (context) => const HotelScreen(),
            );
            break;
          default:
            pageRoute = MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            );
        }

        return pageRoute;
      },
    );
  }
}
