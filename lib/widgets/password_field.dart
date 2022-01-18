import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jtc_mini_project/widgets/text_field_container.dart';

import '../constants.dart';

class PasswordField extends StatefulWidget {
  final String hintText;
  final SvgPicture icon;
  final TextEditingController controller;

  const PasswordField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(color: kGreyColor),
        controller: widget.controller,
        cursorColor: kPrimaryColor,
        obscureText: isHidden,
        decoration: InputDecoration(
            icon: widget.icon,
            hintText: widget.hintText,
            border: InputBorder.none,
            suffixIcon: GestureDetector(
                onTap: () { togglePasswordVisibility(); },
                child: isHidden
                    ? SvgPicture.asset(
                  "assets/icons/visibility_off.svg",
                  fit: BoxFit.scaleDown,
                )
                    : SvgPicture.asset(
                    "assets/icons/visibility.svg",
                    fit: BoxFit.scaleDown
                )
            )

        ),
        validator: (password) => password != null && password.length < 8
            ? 'Enter min. 8 characters'
            : null
      ),
    );
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}