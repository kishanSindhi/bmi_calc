import 'package:bmi_calc/bmi_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_card.dart';
import '../components/calculate_button.dart';
import '../components/constants.dart';
import '../components/custom_card.dart';
import '../components/icon_content.dart';
import 'result_page.dart';

enum Gender { male, female }

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender? selectedGender;
  double height = 180.0;
  int weight = 50;
  int age = 25;
  void cardColorChange(Gender gender) {
    setState(() {
      gender == Gender.male
          ? selectedGender = Gender.male
          : selectedGender = Gender.female;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomCard(
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveColor,
                  cardChild: GenderCard(
                    onPressed: () => cardColorChange(Gender.male),
                    icon: FontAwesomeIcons.person,
                    text: "MALE",
                  ),
                ),
                CustomCard(
                  color: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveColor,
                  cardChild: GenderCard(
                    onPressed: () => cardColorChange(Gender.female),
                    icon: FontAwesomeIcons.personDress,
                    text: "FEMALE",
                  ),
                ),
              ],
            ),
          ),
          CustomCard(
            color: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "HEIGHT",
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "${height.round()}",
                      style: kNumberTextStyle,
                    ),
                    const Text(
                      "cms",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbColor: kButtonColor,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kFontColor,
                      overlayColor: const Color(0x29eb1555),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30,
                      )),
                  child: Slider(
                    value: height,
                    min: kMinHeight,
                    max: kMaxHeight,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CustomCard(
                  color: kActiveCardColor,
                  cardChild: BottomCard(
                    number: weight,
                    heading: "Weight",
                    minusButtonOnTap: () {
                      setState(() {
                        weight--;
                      });
                    },
                    plusButtonOnTap: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
                CustomCard(
                  color: kActiveCardColor,
                  cardChild: BottomCard(
                    heading: "Age",
                    number: age,
                    minusButtonOnTap: () {
                      setState(() {
                        age--;
                      });
                    },
                    plusButtonOnTap: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            onTap: () {
              BMIBrain bmiBrain = BMIBrain(
                height: height.round(),
                weight: weight,
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    bmiResult: bmiBrain.calculateBMI(),
                    interpretation: bmiBrain.getInterpretation(),
                    resultText: bmiBrain.getResult(),
                  ),
                ),
              );
            },
            text: "CALCULATE",
          ),
        ],
      ),
    );
  }
}
