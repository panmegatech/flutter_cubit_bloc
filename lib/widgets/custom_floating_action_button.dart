import 'package:flutter/material.dart';
import 'package:flutter_bloc_simple/utils/utils.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? name;

  const CustomFloatingActionButton({super.key, this.onPressed, this.name});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: generateRandomString(5),
      onPressed: onPressed,
      child: Text(name ?? ""),
    );
  }
}
