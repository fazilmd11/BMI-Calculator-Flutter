import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:page_transition/page_transition.dart';

enum Gender {
  male,
  female,
}

int height = 160;
int weight = 60;
int age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  // BalloonSlider(
                  //   value: height.toDouble(),
                  //   onChanged: (double newValue) {
                  //     setState(() {
                  //       height = newValue.round();
                  //     });
                  //   },
                  //   showRope: true,
                  //   ropeLength: 100,
                  // ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 24)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
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
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT(kg)',
                          style: kLabelTextStyle,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.baseline,
                        //   textBaseline: TextBaseline.alphabetic,
                        //   children: [
                        //     Text(
                        //       weight.toString(),
                        //       style: kNumberTextStyle,
                        //     ),
                        //     Text(
                        //       'kg',
                        //       style: kLabelTextStyle,
                        //     )
                        //   ],
                        // ),
                        NumberPicker(
                          // axis: Axis.horizontal,
                          selectedTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                          itemHeight: 50,
                          minValue: 40,
                          maxValue: 150,
                          value: weight,
                          onChanged: (value) => setState(() => weight = value),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white),
                          ),
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     IconButton(
                        //       icon: Icon(Icons.remove),
                        //       onPressed: () => setState(() {
                        //         final newValue = weight - 10;
                        //         weight = newValue.clamp(0, 100);
                        //       }),
                        //     ),
                        //     Text('$weight'),
                        //     IconButton(
                        //       icon: Icon(Icons.add),
                        //       onPressed: () => setState(() {
                        //         final newValue = weight + 20;
                        //         weight = newValue.clamp(0, 100);
                        //       }),
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     RoundIconButton(
                        //       icon: FontAwesomeIcons.minus,
                        //       onPressed: () {
                        //         setState(() {
                        //           weight--;
                        //         });
                        //       },
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     RoundIconButton(
                        //       icon: FontAwesomeIcons.plus,
                        //       onPressed: () {
                        //         setState(() {
                        //           weight++;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // BottomButton(
          //   onTap: () {
          //     CalculatorBrain calc =
          //         CalculatorBrain(height: height, weight: weight);
          //
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => ResultsPage(
          //                   TitleText: calc.getResults(),
          //                   bmiResult: calc.calculateBMI(),
          //                   Interpretation: calc.getInterpretation(),
          //                 )));
          //   },
          //   buttonTitle: 'CALCULATE',
          // ),
          ConfirmationSlider(
            // foregroundColor: Colors.white,
            foregroundColor: kActiveCardColour,
            backgroundColor: kBottomContainerColour,
            text: 'CALCULATE',
            textStyle: kLargeButtonTextStyle,
            onConfirmation: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  // PageTransition(
                  //     type: PageTransitionType.leftToRight,
                  //     child: ResultsPage(
                  //       TitleText: calc.getResults(),
                  //       bmiResult: calc.calculateBMI(),
                  //       Interpretation: calc.getInterpretation(),
                  //     )));
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            TitleText: calc.getResults(),
                            bmiResult: calc.calculateBMI(),
                            Interpretation: calc.getInterpretation(),
                          )));
            },
          )
        ],
      ),
    );
  }
}

// class _IntegerExample extends StatefulWidget {
//   @override
//   __IntegerExampleState createState() => __IntegerExampleState();
// }
//
// class __IntegerExampleState extends State<_IntegerExample> {
//   int _currentValue = 60;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         NumberPicker(
//           value: _currentValue,
//           minValue: 40,
//           maxValue: 150,
//           onChanged: (value) => setState(() => _currentValue = value),
//         ),
//         Text('Current value: $_currentValue'),
//       ],
//     );
//   }
// }
