import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jtc_mini_project/constants.dart';
import 'package:jtc_mini_project/widgets/text_field_container.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final SvgPicture icon;
  final TextEditingController controller;
  final String type;
  const InputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.type,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return TextFieldContainer(
      child: TextField(
        textAlignVertical: type == 'password' ? TextAlignVertical.center : null,
        style: const TextStyle(color: kGreyColor),
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: type == 'password'
              ? SvgPicture.asset(
              "assets/icons/visibility_off.svg",
              fit: BoxFit.scaleDown) : null
        ),
      ),
    );
  }
}