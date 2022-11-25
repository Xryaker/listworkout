import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar/appbar_main.dart';
import 'package:flutter_application_1/pages/acount_info.dart';
import 'package:flutter_application_1/widgets/bezier_chart.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  String get allCalories => '100000';
  String get currentKcal => '500';

  // ignore: recursive_getters

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/im.jpg'), // <-- BACKGROUND IMAGE
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    allCaloriesInfo('ALL', allCalories),
                    allCaloriesInfo('NOW', currentKcal),
                  ],
                  //
                ),
              ),
              BazierChartt(),
            ],
          ),
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar('GYM TRACKER'),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: floatingActionMain(context)),
    );
  }

  floatingActionMain(BuildContext context) {
    return Stack(children: <Widget>[
      Align(
        alignment: Alignment.bottomLeft,
        child: FloatingActionButton(
            heroTag: 'userINFO',
            backgroundColor: Color.fromARGB(167, 255, 255, 255),
            onPressed: () => Navigator.pushNamed(context, '/person'),
            child: const Icon(
              Icons.account_circle,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 50,
            )),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          heroTag: 'GYM',
          backgroundColor: Color.fromARGB(167, 255, 255, 255),
          onPressed: () => Navigator.pushNamed(context, '/training'),
          child: const ImageIcon(
            AssetImage('assets/images/muscl.png'),
            size: 80,
            color: Colors.black,
          ),
        ),
      ),
    ]);
  }

  Widget allCaloriesInfo(String name, String kcal) {
    // ignore: prefer_const_constructors

    String textName = name;
    return Container(
      width: 150,
      height: 150,
      //margin: const EdgeInsets.all(200.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(125, 158, 158, 158),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              kcal,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              'kcal',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  lastCalorieInfo() {}
}
