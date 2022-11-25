import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../appbar/appbar_main.dart';

class TrainingDay extends StatefulWidget {
  TrainingDay({required String title, super.key}) {
    this.title = title;
  }
  @override
  late final String title;
  State<TrainingDay> createState() => _TrainingDayState();
}

class _TrainingDayState extends State<TrainingDay> {
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
          appBar: CustomAppBar(widget.title),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          //  floatingActionButton: floatingActionChangeAcount(context),
          body: WorkList(),
        ));
  }

  WorkList() {}
}
