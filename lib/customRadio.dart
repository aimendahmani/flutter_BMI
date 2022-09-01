import 'package:flutter/material.dart';
import 'theme.dart';

class Gender {
  String name;
  IconData icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}

class CustomRadio extends StatelessWidget {
  Gender _gender;

  CustomRadio(this._gender);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: _gender.isSelected
            ? CustomTheme.isDarkTheme
                ? Color(0xFFA91079)
                : Color.fromARGB(255, 16, 108, 169)
            : Colors.white,
        child: Container(
          alignment: Alignment.center,
          width: 150,
          height: 100,
          margin: new EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                _gender.icon,
                color: _gender.isSelected ? Colors.white : Colors.grey.shade700,
                size: 30,
              ),
              SizedBox(height: 10),
              Text(
                _gender.name,
                style: TextStyle(
                    fontSize: 20,
                    color: _gender.isSelected
                        ? Colors.white
                        : Colors.grey.shade700),
              )
            ],
          ),
        ));
  }
}
