import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/pages/acount_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appbar/appbar_main.dart';
import '../model/User.dart';
import 'create_list_gym.dart';

class CreateAcount extends StatefulWidget {
  const CreateAcount({super.key});

  @override
  State<CreateAcount> createState() => _CreateAcountState();
}

class _CreateAcountState extends State<CreateAcount> {
  late String name = '';
  late double height = 0.0;
  late double weight = 0.0;
  late String trainingType = '';
  final List<String> _trainingDays = [
    '1 day at weak',
    '2 days at weak',
    '3 days at weak',
    '4 days at weak',
    '5 days at weak'
  ];
  List days = [];
  @override
  void initState() {
    super.initState();
    numbersofListDays();
    _nameController = TextEditingController();
    _heightController = TextEditingController();
    _weightController = TextEditingController();
  }

  final _scafoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;

  User newUser = new User();
  String? _selectedTrainingType;
  @override
  void dispose() {
    _heightController.dispose();
    _nameController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.black, width: 2.0),
    );
    var outlineInputBorder2 = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Colors.blue, width: 2.0),
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/im.jpg'), // <-- BACKGROUND IMAGE
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        key: _scafoldKey,
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar('Create Acount'),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: floatingActionCreateAccount(context),
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                TextFormField(
                  //  initialValue: name.toString(),
                  validator: validateName,
                  onSaved: (value) => newUser.name = value!,
                  controller: _nameController,
                  style: TextStyle(),
                  decoration: InputDecoration(
                    labelText: "Full name *",
                    labelStyle: TextStyle(color: Colors.white),
                    //hintText: 'What do people call you?',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                      onTap: () {
                        _nameController.clear();
                      },
                    ),
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: validateHeight,
                  onSaved: (value) => newUser.height = double.parse(value!),
                  controller: _heightController,
                  decoration: InputDecoration(
                    labelText: "Height *",
                    labelStyle: TextStyle(color: Colors.white),
                    //hintText: 'What do people call you?',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                      onTap: () {
                        _heightController.clear();
                      },
                    ),
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: validateHeight,
                  onSaved: (value) => newUser.weight = double.parse(value!),
                  controller: _weightController,
                  decoration: InputDecoration(
                    labelText: "Weight *",
                    labelStyle: TextStyle(color: Colors.white),
                    //hintText: 'What do people call you?',
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                      onTap: () {
                        _weightController.clear();
                      },
                    ),
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                  dropdownColor: Colors.transparent,
                  validator: ((value) =>
                      value == null && days.isEmpty ? 'field requared' : null),
                  //  onSaved: (value) => newUser.trainingType = value!,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'TrainingType?'),
                  items: _trainingDays.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: ((data) {
                    print(data);
                    setState(
                      () {
                        _selectedTrainingType = data as String?;
                        days = createDays(_selectedTrainingType);
                      },
                    );
                  }),
                  value: _selectedTrainingType,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 500,
                  child: ListView.builder(
                    itemCount: numbersofListDays(),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.transparent,
                        child: ListTile(
                          title: Text(
                            days[index],
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CreateListGymWorkout(
                                            title: days[index].toString())));

                                //days.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }

  floatingActionCreateAccount(BuildContext context) {
    return Stack(children: <Widget>[
      Align(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton(
            heroTag: 'Save',
            backgroundColor: Color.fromARGB(167, 255, 255, 255),
            onPressed: submitForm,
            child: const Icon(
              Icons.save_alt_rounded,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 50,
            )),
      ),
    ]);
  }

  String? validateName(String? value) {
    final _nameExp = RegExp('^[A-Za-z]');
    if (value!.isEmpty) {
      return 'Name is required.';
    } else if (!_nameExp.hasMatch(value)) {
      return 'Please enter alphavit character';
    } else {
      return null;
    }
  }

  void submitForm() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      savedUser();
      Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const PersonInfo()),
        ModalRoute.withName('/'),
      );
    } else {
      showMassage(massage: 'form invalide');
    }
  }

  void showMassage({required String massage}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      margin: EdgeInsets.only(bottom: 40.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      content: Text(
        massage,
        style: TextStyle(
            color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600),
      ),
    ));
  }

  String? validateHeight(String? value) {
    final _nameExp = RegExp('^[0-9]');
    if (value!.isEmpty) {
      return 'Name is required.';
    } else if (!_nameExp.hasMatch(value)) {
      return 'Please enter alphavit character';
    } else {
      return null;
    }
  }

  Future<void> savedUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', newUser.name);
    prefs.setDouble('height', newUser.height);
    prefs.setDouble('weight', newUser.weight);
    //  prefs.setString('tariningType', newUser.trainingType);
    prefs.setStringList('trainingDays', days as List<String>);
  }

  int colDays() {
    return 3;
  }

  List<String> createDays(String? selectedTrainingType) {
    List<String> result = [];
    switch (selectedTrainingType) {
      case '1 day at weak':
        result = ['1st training day'];
        break;
      case '2 days at weak':
        result = ['1st training day', '2nd training day'];
        break;
      case '3 days at weak':
        result = ['1st training day', '2nd training day', '3кd training day'];
        break;
      case '4 days at weak':
        result = [
          '1st training day',
          '2nd training day',
          '3кd training day',
          '4th training day'
        ];
        break;
      case '5 days at weak':
        result = [
          '1st training day',
          '2nd training day',
          '3кd training day',
          '4th training day',
          '5th training day'
        ];
        break;
    }
    return result;
  }

  int numbersofListDays() {
    loadListDays('trainingDays');
    return days.length;
  }

  loadListDays(String title) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (days.isEmpty) {
      if (sharedPreferences.getStringList(title) != null) {
        setState(() {
          days = sharedPreferences.getStringList(title) as List<String>;
          name = sharedPreferences.getString('name')!;
          height = sharedPreferences.getDouble('height')!;
          weight = sharedPreferences.getDouble('weight')!;
          _nameController = TextEditingController(text: name);
          _heightController = TextEditingController(text: height.toString());
          _weightController = TextEditingController(text: weight.toString());
        });
      }
    }
  }
}
