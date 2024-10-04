import 'package:flutter/material.dart';
import 'package:flutter_bloc_simple/widgets/custom_text.dart';

class CustomScaffold extends StatelessWidget {
  final List<Widget> children;

  final String title;

  const CustomScaffold({
    super.key,
    required this.children,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: children,
        ),
      ),
    );
  }
}
