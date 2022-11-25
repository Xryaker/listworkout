import 'package:flutter/material.dart';
import 'package:flutter_application_1/appbar/appbar_main.dart';
import 'package:flutter_application_1/data/data_gym.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateListGymWorkout extends StatefulWidget {
  CreateListGymWorkout({required String title, super.key}) {
    this.title = title;
  }

  @override
  late final String title;

  State<CreateListGymWorkout> createState() => _CreateListGymWorkoutState();
}

class _CreateListGymWorkoutState extends State<CreateListGymWorkout> {
  String _dropDownValue = "SELECT TODO";

  late List<String> todoList = [];
  @override
  void initState() {
    // loadList(widget.title);
    super.initState();
  }

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
          body: ListView.builder(
              itemCount: numbers(),
              itemBuilder: (BuildContext context, index) {
                return Dismissible(
                  key: Key(todoList[index]),
                  child: Card(
                    color: Color.fromARGB(165, 255, 255, 255),
                    child: ListTile(
                      title: Text(
                        todoList[index],
                        style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_sweep),
                        onPressed: () {
                          setState(() {
                            todoList.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                );
              }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: floatingActionMenuList()),
    );
  }

  Widget floatingActionMenuList() {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
              heroTag: 'saveGymList',
              backgroundColor: Color.fromARGB(167, 255, 255, 255),
              onPressed: () async {
                final sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.setStringList(widget.title, todoList);
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.save,
                color: Color.fromARGB(255, 0, 0, 0),
              )),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            heroTag: 'ADD',
            backgroundColor: const Color.fromARGB(174, 255, 255, 255),
            onPressed: () {
              dialogAlertMenu();
            },
            child: const Icon(
              Icons.add,
              color: Color.fromARGB(255, 5, 1, 1),
            ),
          ),
        ),
      ],
    );
  }

  void dialogAlertMenu() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(174, 158, 158, 158),
            title: Text(_dropDownValue),
            content: DropdownButton(
              isExpanded: true,
              iconSize: 30.0,
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              items: TODO.getTODO().map(
                (val) {
                  return DropdownMenuItem<String>(
                    value: val,
                    child: Text(val),
                  );
                },
              ).toList(),
              onChanged: (val) {
                setState(
                  () {
                    todoList.add(val!);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          );
        });
  }

  loadList(String title) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (todoList.isEmpty) {
      if (sharedPreferences.getStringList(title) != null) {
        setState(() {
          todoList = sharedPreferences.getStringList(title) as List<String>;
        });
      }
    }
  }

  int numbers() {
    loadList(widget.title);
    return todoList.length;
  }
}
