import 'package:bmi_calculator2/constance/constance.dart';
import 'package:bmi_calculator2/widgets/left_shape_widget.dart';
import 'package:bmi_calculator2/widgets/right_shape_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightTextField = TextEditingController();
  final hightTextField = TextEditingController();

  double resultBMI = 0;
  String? resultText;

  double widthGood = 50;
  double widthBad = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarColor,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        spacing: 40,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 100),
              Container(
                width: 130,
                child: TextField(
                  controller: weightTextField,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Weight',
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                width: 130,
                child: TextField(
                  controller: hightTextField,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Hight',
                    hintStyle: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              final weight = double.parse(weightTextField.text);
              final hight = double.parse(hightTextField.text);
              setState(() {
                resultBMI = weight / (hight * hight);
                if (resultBMI > 25) {
                  widthBad = 300;
                  widthGood = 50;
                  resultText = 'You have over weight';
                } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                  widthBad = 50;
                  widthGood = 300;
                  resultText = 'Your weght is normanl';
                } else {
                  widthBad = 10;
                  widthGood = 10;
                  resultText = 'You have under weight';
                }
              });
            },
            child: Text(
              'Calculate!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Text(
            '${resultBMI.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
              color: Colors.black,
            ),
          ),
          Text(
            '$resultText',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          Column(
            spacing: 10,
            children: [
              LeftShape(width: widthGood),
              RightShape(width: widthBad),
            ],
          ),
        ],
      ),
    );
  }
}
