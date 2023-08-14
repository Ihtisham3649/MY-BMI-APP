import 'package:bmi_calculator_am/Components/ContainerData.dart';
import 'package:bmi_calculator_am/Components/InsideContainer.dart';
import 'package:bmi_calculator_am/Components/bottom_button.dart';
import 'package:bmi_calculator_am/Components/round_button.dart';
import 'package:bmi_calculator_am/Screens/results_page.dart';
import 'package:bmi_calculator_am/bmi_brain.dart';
import 'package:bmi_calculator_am/constants.dart';
import 'package:flutter/material.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'BMI CALCULATOR',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //FIRST CONTAINER OF A ROW
                  Expanded(
                    child: containerData(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      containerCOLOR: selectedGender == Gender.male
                          ? kActiveColor
                          : kInactiveColor,
                      cardContent: InsideContainers(
                          genderName: 'MALE', icons: Icons.male),
                    ),
                  ),

                  //Second CONATINER OF A ROW
                  Expanded(
                    child: containerData(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      containerCOLOR: selectedGender == Gender.female
                          ? kActiveColor
                          : kInactiveColor,
                      cardContent: InsideContainers(
                        genderName: 'FEMALE',
                        icons: Icons.female,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //2nd container of the column
            Expanded(
              child: containerData(
                containerCOLOR: const Color.fromARGB(100, 28, 28, 45),
                cardContent: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('HEIGHT', style: kTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kBigFont),
                        const Text('cm', style: kTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x35EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15, pressedElevation: 30),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          // activeColor: const Color(0xFFEB1555),
                          // inactiveColor: const Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              //weight and age boxes
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //WEIGHT BOX
                  Expanded(
                    child: containerData(
                      containerCOLOR: const Color.fromARGB(100, 28, 28, 45),
                      cardContent: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: kTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kBigFont,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundButton(
                                    incDec: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    }),
                                const SizedBox(
                                  width: 12,
                                ),
                                RoundButton(
                                    incDec: Icons.add,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    }),
                              ],
                            ),
                          ]),
                    ),
                  ),

                  //AGE BOX
                  Expanded(
                    child: containerData(
                      containerCOLOR: const Color.fromARGB(100, 28, 28, 45),
                      cardContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kBigFont,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                  incDec: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              const SizedBox(
                                width: 12,
                              ),
                              RoundButton(
                                  incDec: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //CALCULATE BUTTON
            BottomButton(
                onTap: () {
                  BmiBrain cal = BmiBrain(height: height, weight: weight);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ResultsPage(
                        bmiNumber: cal.bmiCal(),
                        bmiStatement: cal.getStatement(),
                        bmiResult: cal.getResult(),
                      );
                    },
                  ));
                },
                buttonTitle: 'CALCULATE'),
          ],
        ),
      ),
    );
  }
}
