import 'package:flutter/material.dart';
import '../constants/constants.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Color? color;
  final bool centered;

  const SectionTitle({
    Key? key,
    required this.title,
    this.color,
    this.centered = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Constants.headingStyle.copyWith(
            color: color ?? Constants.secondaryColor,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 4,
          width: 60,
          decoration: BoxDecoration(
            color: Constants.primaryColor,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Constants.primaryColor, Constants.secondaryColor],
            ),
          ),
        ),
        const SizedBox(height: Constants.defaultPadding),
      ],
    );
  }
}
