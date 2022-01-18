import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jtc_mini_project/constants.dart';
import 'package:jtc_mini_project/widgets/input_field.dart';
import 'package:jtc_mini_project/widgets/rounded_button.dart';
import 'package:provider/provider.dart';
import '/services/auth_service.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    final authService = Provider.of<AuthService>(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("SIGN IN",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  )
              ),
              const SizedBox(height: 10),
              const Text("Please login to continue",
                  style: TextStyle(
                      color: kGreyColor
                  )
              ),
              const SizedBox(height: 40),
              InputField(
                  hintText: "Enter your email",
                  icon: SvgPicture.asset(
                      "assets/icons/email.svg",
                      height: screenSize.height * 0.04),
                  type: 'normal'
              ),
              InputField(
                  hintText: "Enter your password",
                  icon: SvgPicture.asset(
                      "assets/icons/password.svg",
                      height: screenSize.height * 0.04),
                  type: 'password'
              ),
              const SizedBox(height: 30),
              RoundedButton(text: 'Sign in', press: () => {}),


            ]

          )

        ],
      )

    );
  }
}