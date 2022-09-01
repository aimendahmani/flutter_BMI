import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme.dart';

class result extends StatefulWidget {
  late int a;
  late int w;
  late double h;
  late String r;
  //result({required this.a, required this.w, required this.h, required this.r});
  @override
  State<StatefulWidget> createState() => _resultState();
}

late int age;
late double height;
late int weight;
late String Res;

class _resultState extends State<result> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getData();
    });

    currentTheme.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currentTheme.currentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI"),
          leading: IconButton(
              onPressed: () {
                removeValues();
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          actions: [
            IconButton(
              onPressed: (() {
                currentTheme.toggleTheme();
              }),
              icon: Icon(Icons.brightness_4_rounded),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "age : ${age}",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color:
                        !CustomTheme.isDarkTheme ? Colors.black : Colors.white),
              ),
              Text(
                "Weight : ${weight}",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color:
                        !CustomTheme.isDarkTheme ? Colors.black : Colors.white),
              ),
              Text(
                "height : ${height}",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color:
                        !CustomTheme.isDarkTheme ? Colors.black : Colors.white),
              ),
              Text(
                "Result : ${Res}",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color:
                        !CustomTheme.isDarkTheme ? Colors.black : Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      age = prefs.getInt('age') ?? 0;
      weight = prefs.getInt('weight') ?? 0;
      height = prefs.getDouble('height') ?? 0.0;
      Res = prefs.getString('result') ?? "";
    });
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove("age");
      //Remove bool
      prefs.remove("weight");
      //Remove int
      prefs.remove("height");
      //Remove double
      prefs.remove("result");
    });
  }
}
