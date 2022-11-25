import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/pages/trainingday.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appbar/appbar_main.dart';

class TrainingsDays extends StatefulWidget {
  const TrainingsDays({super.key});

  @override
  State<TrainingsDays> createState() => _TrainingsDaysState();
}

class _TrainingsDaysState extends State<TrainingsDays> {
  @override
  void initState() {
    super.initState();
    loadListDays('trainingDays');
  }

  late List<String> daysList = [];
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
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar('Training Days'),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          //  floatingActionButton: floatingActionChangeAcount(context),
          body: Training(),
        ));
  }

  Widget Training() {
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: daysList.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: (() {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              TrainingDay(title: daysList[index].toString())));
                });
              }),
              child: Card(
                color: Color.fromARGB(165, 255, 255, 255),
                child: ListTile(
                  title: Text(
                    daysList[index],
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          }),
    );
  }

  loadListDays(String title) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getStringList(title) != null) {
      setState(() {
        daysList = sharedPreferences.getStringList(title) as List<String>;
      });
    }
  }
}
