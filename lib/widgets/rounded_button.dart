import 'package:flutter/material.dart';
import 'package:jtc_mini_project/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: CustomisedElevatedButton(),
      ),
    );
  }

  Widget CustomisedElevatedButton() {
    return ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ));
  }
}
