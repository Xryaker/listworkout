// @dart=2.9
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/acount_info.dart';
import 'package:flutter_application_1/pages/create_list_gym.dart';
import 'package:flutter_application_1/pages/main_sreen.dart';
import 'package:flutter_application_1/pages/trainingday.dart';
import 'package:flutter_application_1/pages/trainingpage.dart';

import 'pages/create_acount.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/todo': (context) => CreateListGymWorkout(),
        '/person': (context) => PersonInfo(),
        '/person/acount': (context) => CreateAcount(),
        '/training': (context) => TrainingsDays(),
        '/training/day': (context) => TrainingDay(),
      },
    ));
