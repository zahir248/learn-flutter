import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage  extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _heightSliderValue = 170;
  double _weightSliderValue = 70;
  var _bmi = 0;
  var _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second App", style: TextStyle(fontSize: 32, color: Colors.white,),) ,backgroundColor: Colors.blue, ),
        body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Text("Bmi Calculator", style: TextStyle(fontSize: 32, color: Colors.blue,)),
                  Image.network("https://static.vecteezy.com/system/resources/previews/016/828/833/original/bmi-classification-chart-measurement-woman-colorful-infographic-with-ruler-female-body-mass-index-scale-collection-from-underweight-to-overweight-fit-person-different-weight-level-eps-vector.jpg"),
                  Text("We care about your health", style: TextStyle(fontSize: 24,)),
                  Text("Height (${_heightSliderValue.round()} cm)", style: TextStyle(fontSize: 18)),
                  Slider(
                    value: _heightSliderValue,
                    max: 200,
                    onChanged: (double value){
                      setState(() {
                        _heightSliderValue = value;
                      });
                    },
                  ),
                  Text("Weight (${_weightSliderValue.round()} kg)", style: TextStyle(fontSize: 18)),
                  Slider(
                    value: _weightSliderValue,
                    max: 150,
                    min: 10,
                    onChanged: (double value){
                      setState(() {
                        _weightSliderValue = value;
                      });
                    },
                  ),
                  _bmi != 0 ? Text("Your BMI is $_bmi", style: _bmi < 18 || _bmi > 25 ? TextStyle(color: Colors.red) : TextStyle(color: Colors.green),) : SizedBox(),
                  Text(_message),
                  TextButton.icon(onPressed: () {

                    // BMI = weight in kg / (height in m)^2
                    var bmiTemp = _weightSliderValue / pow((_heightSliderValue / 100),2);
                    print(bmiTemp);

                    var messageTemp = "";
                    if(bmiTemp < 18){
                      messageTemp = "You are underweight";
                    }else if(bmiTemp < 25){
                      messageTemp = "You are normal";
                    }else if(bmiTemp <30) {
                      messageTemp = "You are overweight";
                    }else{
                      messageTemp = "You are obese";
                    }
                    // In Flutter and React, this means assigning the value bmiTemp.round in _bmi
                    // _bmi = bmiTemp.round();

                    // In Flutter and React Native, this means assigning the value and REFRESH THE UI
                    setState(() {
                      _bmi = bmiTemp.round();
                      _message = messageTemp;
                    });
                  },
                      icon: Icon(Icons.favorite),
                      label: Text("Calculate BMI"),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(Colors.red),)
                      )

                ],
              ),
            ),
          ),

        );
  }
}


