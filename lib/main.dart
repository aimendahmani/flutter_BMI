import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "result.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'theme.dart';
import 'customRadio.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}

late SharedPreferences prefs;
double height = 170.0;
int weight = 70;
int age = 25;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Gender> genders = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentTheme.addListener((() {
      setState(() {});
    }));
    genders.add(new Gender("Male", Icons.male, false));
    genders.add(new Gender("Female", Icons.female, false));
    setDate();
    //setDate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: (() {
                currentTheme.toggleTheme();
              }),
              icon: Icon(Icons.brightness_4_rounded),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: 160,
                  width: 360,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: genders.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.pinkAccent,
                          onTap: () {
                            setState(() {
                              genders.forEach(
                                  (gender) => gender.isSelected = false);
                              genders[index].isSelected = true;
                            });
                          },
                          child: CustomRadio(genders[index]),
                        );
                      })),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)), //here
                  //color: Theme.of(context).primaryColor,
                  color: CustomTheme.isDarkTheme
                      ? Color(0xffA91079)
                      : Color.fromARGB(255, 16, 108, 169),
                  //Color(0xffA91079),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "${height}",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    CupertinoSlider(
                      min: 100.0,
                      max: 200.0,
                      divisions: 100,
                      value: height,
                      activeColor: CustomTheme.isDarkTheme
                          ? Color(0xffF806CC)
                          : Theme.of(context).primaryColor,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 160,
                    height: 160,

                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(10)), //here
                        color: CustomTheme.isDarkTheme
                            ? Color(0xFFA91079)
                            : Color.fromARGB(255, 16, 108, 169)),
                    //color: Colors.blueGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${weight}",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              heroTag: "weight++",
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                              backgroundColor: CustomTheme.isDarkTheme
                                  ? Color(0xFFF806CC)
                                  : Theme.of(context).primaryColor,
                            ),
                            FloatingActionButton(
                              heroTag: "weight--",
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(Icons.remove),
                              backgroundColor: CustomTheme.isDarkTheme
                                  ? Color(0xFFF806CC)
                                  : Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(10)), //here
                        color: CustomTheme.isDarkTheme
                            ? Color(0xFFA91079)
                            : Color.fromARGB(255, 16, 108, 169)),
                    //color: Colors.blueGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${age}",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              heroTag: "age++",
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add),
                              backgroundColor: CustomTheme.isDarkTheme
                                  ? Color(0xFFF806CC)
                                  : Theme.of(context).primaryColor,
                            ),
                            FloatingActionButton(
                              heroTag: "age--",
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(Icons.remove),
                              backgroundColor: CustomTheme.isDarkTheme
                                  ? Color(0xFFF806CC)
                                  : Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    setDate();
                  });
                  print("age :$age weight: $weight height $height");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => result(
                            //  a: age,
                            //  w: weight,
                            //  h: height,
                            //  r: calculRes(weight, height),
                            )),
                  );
                },
                child: Text("Calculate"),
                style: ElevatedButton.styleFrom(
                    primary: CustomTheme.isDarkTheme
                        ? Color(0xFFA91079)
                        : Color.fromARGB(255, 16, 108, 169),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                    textStyle:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

setDate() async {
  prefs = await SharedPreferences.getInstance();
  prefs.setInt('age', age);
  prefs.setInt('weight', weight);
  prefs.setDouble('height', height);
  prefs.setString('result', calculRes(weight, height));
}

String calculRes(int weight, double height) {
  double index = weight.toDouble() / pow(height / 100, 2);
  if (index < 18.5)
    return "UnderWeight";
  else if (index < 25)
    return "Normal";
  else if (index < 30)
    return "Obese";
  else
    return "Severely Obese";
}
