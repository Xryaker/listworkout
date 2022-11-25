import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar/appbar_main.dart';
import 'package:flutter_application_1/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonInfo extends StatelessWidget {
  const PersonInfo({super.key});

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
          appBar: CustomAppBar('Person info'),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: floatingActionChangeAcount(context),
          body: InfoPageWidget(),
        ));
  }

  floatingActionChangeAcount(BuildContext context) {
    return Stack(children: <Widget>[
      Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
            heroTag: 'Change',
            backgroundColor: Color.fromARGB(167, 255, 255, 255),
            onPressed: () => {Navigator.pushNamed(context, '/person/acount')},
            child: const Icon(
              Icons.account_box_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 50,
            )),
      ),
    ]);
  }
}

class InfoPageWidget extends StatefulWidget {
  InfoPageWidget({Key? key}) : super(key: key);

  @override
  InfoPageWidgetState createState() => InfoPageWidgetState();
}

class InfoPageWidgetState extends State<InfoPageWidget> {
  late List<String> daysList = [];
  late String name = '';
  late double height = 0;
  late double weight = 0.0;
  late String imt = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            //color: Colors.amber[600],
            child: Card(
          color: Color.fromARGB(165, 255, 255, 255),
          child: ListTile(
            title: Text(
              'Name :$name',
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )),
        Container(
            // color: Colors.amber[500],
            child: Card(
          color: Color.fromARGB(165, 255, 255, 255),
          child: ListTile(
            title: Text(
              'Haight :$height',
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )),
        Container(
            // color: Colors.amber[100],
            child: Card(
          color: Color.fromARGB(165, 255, 255, 255),
          child: ListTile(
            title: Text(
              'Weight :$weight',
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )),
        Container(
            //color: Colors.amber[600],
            child: Card(
          color: Color.fromARGB(165, 255, 255, 255),
          child: ListTile(
            title: Text(
              'IMT :$imt',
              style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )),
        Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: daysList.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
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
                );
              }),
        ),
      ],
    );
  }

  int numbersofListDays() {
    loadListDays('trainingDays');
    return daysList.length;
  }

  loadListDays(String title) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.getStringList(title) != null) {
      setState(() {
        daysList = sharedPreferences.getStringList(title) as List<String>;
        name = sharedPreferences.getString('name').toString();
        height = sharedPreferences.getDouble('height')!;
        weight = sharedPreferences.getDouble('weight')!;
        imt = (weight / ((height / 100) * (height / 100))).toString();
      });
    }
  }

  // nameInfo() async {
  //   final sharedPreferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     name = sharedPreferences.getString('name').toString();
  //     height = sharedPreferences.getDouble('height')!;
  //     weight = sharedPreferences.getDouble('weight')!;
  //     imt = (weight / ((height / 100) * (height / 100))).toString();
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadListDays('trainingDays');
  }
}
