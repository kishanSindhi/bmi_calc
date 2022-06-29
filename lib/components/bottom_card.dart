import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_button.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({
    Key? key,
    required this.heading,
    required this.number,
    required this.minusButtonOnTap,
    required this.plusButtonOnTap,
  }) : super(key: key);
  final String heading;
  final int number;
  final VoidCallback minusButtonOnTap;
  final VoidCallback plusButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          heading,
          style: kLabelTextStyle,
        ),
        Text(
          "$number",
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onTap: minusButtonOnTap,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onTap: plusButtonOnTap,
            )
          ],
        )
      ],
    );
  }
}
