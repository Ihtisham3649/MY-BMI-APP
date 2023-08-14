import 'package:bmi_calculator_am/Components/ContainerData.dart';
import 'package:bmi_calculator_am/Components/bottom_button.dart';
import 'package:bmi_calculator_am/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiResult,required this.bmiNumber, required this.bmiStatement});

  final String bmiResult ;
  final String bmiNumber;
  final String bmiStatement;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 32),
            child: const Text(
              'Your Result',
              style: kYourResult,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: containerData(
            containerCOLOR: const Color.fromARGB(100, 28, 28, 45),
            cardContent: Container(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      bmiResult,
                      style: kResultTest,
                    ),
                  ),
                  Expanded(
                    child: Text(
                        textAlign: TextAlign.center,
                        bmiNumber,
                        style: kNumberResult),
                  ),
                  Expanded(
                    child: Text(
                      textAlign: TextAlign.center,
                      bmiStatement,
                      style: kDescriptionResultText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        BottomButton(
          buttonTitle: 'RE-CALCULATE',
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ]),
    );
  }
}
