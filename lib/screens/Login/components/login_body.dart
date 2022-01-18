import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jtc_mini_project/constants.dart';
import 'package:jtc_mini_project/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '/services/auth_service.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final authService = Provider.of<AuthService>(context);

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Form(
        key: formKey,
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
                  EmailField(
                    hintText: "Enter your email",
                    icon: SvgPicture.asset(
                        "assets/icons/email.svg",
                        height: screenSize.height * 0.04),
                    controller: emailController,
                  ),
                  PasswordField(
                      hintText: "Enter your password",
                      icon: SvgPicture.asset(
                          "assets/icons/password.svg",
                          height: screenSize.height * 0.04),
                      controller: passwordController
                  ),
                  const SizedBox(height: 30),
                  RoundedButton(text: 'Sign in', press: () => login(authService)),
                ]
            )
          ],
        )
      )
    );
  }

  void login(authService) {
    final form = formKey.currentState!;

    if (form.validate()) {
      authService.signInWithEmailAndPassword(
          emailController.text,
          passwordController.text
      );

      //TODO: handle error messages from firebase auth and show to user.
    }
  }
}