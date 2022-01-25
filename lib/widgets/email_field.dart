import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jtc_mini_project/constants.dart';
import 'package:jtc_mini_project/widgets/text_field_container.dart';

class EmailField extends StatelessWidget {
  final String hintText;
  final SvgPicture icon;
  final TextEditingController controller;
  const EmailField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        style: const TextStyle(color: kGreyColor),
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          border: InputBorder.none,
        ),
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? 'Enter a valid email'
            : null,
      ),
    );
  }
}
