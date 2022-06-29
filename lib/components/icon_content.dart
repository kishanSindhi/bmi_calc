import 'package:flutter/material.dart';

import 'constants.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80.0,
          ),
          const SizedBox(height: 15),
          Text(
            text,
            style: kLabelTextStyle,
          ),
        ],
      ),
    );
  }
}
