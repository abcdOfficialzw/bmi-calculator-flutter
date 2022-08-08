import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Row(children: [
          Expanded(
              child: ReusableCard(
            onPressed: () {
              setState(() {
                gender = Gender.male;
              });
            },
            color:
                gender == Gender.male ? kActiveCardColor : kInactiveCardColor,
            cardChild: IconContent(
              icon: FontAwesomeIcons.mars,
              text: 'MALE',
            ),
          )),
          Expanded(
              child: ReusableCard(
            onPressed: () {
              setState(() {
                gender = Gender.female;
              });
            },
            color:
                gender == Gender.female ? kActiveCardColor : kInactiveCardColor,
            cardChild: IconContent(
              icon: FontAwesomeIcons.venus,
              text: 'FEMALE',
            ),
          ))
        ])),
        Expanded(
            child: ReusableCard(
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HEIGHT',
                style: kLabelTextStyle,
              ),
              Row(
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(height.toString(), style: kNumberStyle),
                  Text(
                    'cm',
                    style: kLabelTextStyle,
                  ),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  inactiveTrackColor: Color(0xFF8D8E98),
                  activeTrackColor: Colors.white,
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x15EB1555),
                  trackHeight: 2,
                ),
                child: Slider(
                  value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  //activeColor: Color(0xFFEB1555),

                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              )
            ],
          ),
          color: kActiveCardColor,
        )),
        Expanded(
            child: Row(children: [
          Expanded(
              child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'WEIGHT',
                  style: kLabelTextStyle,
                ),
                Text(
                  weight.toString(),
                  style: kNumberStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundIconButton(
                      onPressed: () {
                        setState(() {
                          weight--;
                        });
                      },
                      icon: FontAwesomeIcons.minus,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RoundIconButton(
                      onPressed: () {
                        setState(() {
                          weight++;
                        });
                      },
                      icon: FontAwesomeIcons.plus,
                    )
                  ],
                )
              ],
            ),
            color: kActiveCardColor,
          )),
          Expanded(
              child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AGE',
                  style: kLabelTextStyle,
                ),
                Text(
                  age.toString(),
                  style: kNumberStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundIconButton(
                      onPressed: () {
                        setState(() {
                          age--;
                        });
                      },
                      icon: FontAwesomeIcons.minus,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RoundIconButton(
                      onPressed: () {
                        setState(() {
                          age++;
                        });
                      },
                      icon: FontAwesomeIcons.plus,
                    )
                  ],
                )
              ],
            ),
            color: kActiveCardColor,
          ))
        ])),
        BottomButton(
          onTap: () {
            CalculatorBrain calc = CalculatorBrain(
              weight: weight,
              height: height,
            );

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                        bmiResult: calc.getBMI(),
                        bmiINterpretation: calc.getInterpretation(),
                        resultText: calc.getResults())));
          },
          buttonTitle: 'CALCULATE',
        )
      ]),
    );
  }
}
