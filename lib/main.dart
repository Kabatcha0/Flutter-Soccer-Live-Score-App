import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scoreboard/modules/scoreboard.dart';
import 'package:scoreboard/shared/blocobserver.dart';
import 'package:scoreboard/shared/network/dio.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: ScoreBoard(),
    );
  }
}
