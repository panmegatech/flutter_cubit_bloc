import 'dart:math';
import 'package:flutter/material.dart';

String randomString(int length) {
  final Random random = Random();

  const characters =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  return List.generate(
      length, (index) => characters[random.nextInt(characters.length)]).join();
}

Color randomColor() {
  return Color.fromARGB(
    255,
    Random().nextInt(256), // Random value for red
    Random().nextInt(256), // Random value for green
    Random().nextInt(256), // Random value for blue
  );
}

bool randomBoolean() {
  Random random = Random();
  return random.nextBool();
}
