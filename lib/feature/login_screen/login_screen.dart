import 'package:flutter/material.dart';
import 'package:yolo/core/data/constants/login_screen_constants.dart';
import 'package:yolo/feature/login_screen/repository/login_service.dart';
import 'package:yolo/widgets/reusable_textfield.dart';

class Login extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';

  Future<void> login(enteredEmail, enteredPassword) async {
    LoginService loginService = LoginService();

    var data = await loginService.login(enteredEmail, enteredPassword);

    if (data.runtimeType != String) {
      Navigator.pushNamed(context, 'items_screen');
    } else {
      Navigator.pushNamed(context, 'error_screen');
    }
  }

  final fieldTextController = TextEditingController();
  final fieldPasswordController = TextEditingController();

  void clearText() {
    fieldTextController.clear();
    fieldPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Yolo',
                  textAlign: TextAlign.center,
                  style: appNameStyle,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Explore more colors to to market your brands right way..',
                  textAlign: TextAlign.center,
                  style: subTitleStyle,
                ),
                SizedBox(
                  height: 50.0,
                ),
                ReusableTextField(
                  onPressedCallback: (String newValue) => email = newValue,
                  suffixIcon: Icons.account_circle,
                  hintText: 'Enter email address',
                  isObsecureText: false,
                  controller: fieldTextController,
                ),
                SizedBox(
                  height: 20.0,
                ),
                ReusableTextField(
                  onPressedCallback: (String newValue) => password = newValue,
                  suffixIcon: Icons.lock,
                  hintText: 'Enter Password',
                  isObsecureText: true,
                  controller: fieldPasswordController,
                ),
                SizedBox(
                  height: 30.0,
                ),
                FlatButton(
                  onPressed: () async {
                    await login(email, password);
                    clearText();
                  },
                  textColor: Colors.white,
                  padding: EdgeInsets.all(20.0),
                  color: Color(0xFF4D1FD2),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
