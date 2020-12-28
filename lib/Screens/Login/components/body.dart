import 'package:flutter/material.dart';
import 'package:daily_note/Screens/Login/components/background.dart';
import 'package:daily_note/Screens/Signup/signup_screen.dart';
import 'package:daily_note/components/already_have_an_account_acheck.dart';
import 'package:daily_note/components/rounded_button.dart';
import 'package:daily_note/components/rounded_input_field.dart';
import 'package:daily_note/components/rounded_password_field.dart';
import 'package:daily_note/Screens/Home/home_screen.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var email;
    var pass;
    var invalid = ""; // PROMPT
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                pass = value;
              },
            ),
            Text(invalid),
            RoundedButton(
              text: "LOGIN",
              press: () {
                if (email == "admin" && pass == "123") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Home();
                      },
                    ),
                  );
                } else {
                  invalid =
                      "Invalid password or email."; // ADD AUTHENTICATION HERE
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
