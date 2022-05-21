import 'package:flutter/material.dart';
import 'package:flutter_api_rest/api/authentication_api.dart';
import 'package:flutter_api_rest/utils/dialogs.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgets/input_text.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = "", _password = "", _username = "";
  final AuthenticationAPI _authenticationAPI = AuthenticationAPI();

  Future<void> _submit() async {
    final isOk = !_formKey.currentState!.validate();
    print("Form isOk $isOk");
    if (isOk) {
      ProgressDialog.show(context);
      await _authenticationAPI.register(
          username: _username, email: _email, password: _password);
      ProgressDialog.dismisss(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
        bottom: 30,
        child: Container(
          constraints:
              BoxConstraints(maxWidth: responsive.isTablet ? 430 : 360),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "Username",
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  _username = text; //print("Email: $text");
                },
                validator: (text) {
                  if (text!.trim().length < 5) {
                    return "Invalid Username";
                  }
                  return "";
                },
              ),
              SizedBox(height: responsive.dp(2)),
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "Email",
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  _email = text; //print("Email: $text");
                },
                validator: (text) {
                  String ar = "@";
                  //var oo = text?.contains("@");
                  if (!text!.contains("@")) {
                    return "Invalid Email";
                  }
                  return "";
                },
              ),
              InputText(
                label: "Password",
                obscureText: true,
                borderEnabled: false,
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  _password = text; //print("Password: $text");
                },
                validator: (text) {
                  if (text!.trim().length < 8) {
                    return "Invalid Password";
                  }
                  return "";
                },
              ),
              /*Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InputText(
                        label: "Password",
                        obscureText: true,
                        borderEnabled: false,
                        fontSize:
                            responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                        onChanged: (text) {
                          _password = text; //print("Password: $text");
                        },
                        validator: (text) {
                          if (text!.trim().length == 0) {
                            return "Invalid Password";
                          }
                          return "";
                        },
                      ),
                    ),
                    TextButton(
                      //padding: EdgeInsets.symmetric(vertical: 10),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black26,
                            fontSize:
                                responsive.dp(responsive.isTablet ? 1.2 : 1.5)),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),*/
              SizedBox(height: responsive.dp(5)),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white, fontSize: responsive.dp(1.5)),
                  ),
                  onPressed: this._submit,
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      padding: EdgeInsets.symmetric(vertical: 15)),
                  //color: Colors.redAccent
                ),
              ),
              SizedBox(height: responsive.dp(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: responsive.dp(1.5)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context); //Navigator.pushNamed(context, 'register');
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: responsive.dp(1.5)),
                    ),
                  )
                ],
              ),
              SizedBox(height: responsive.dp(10)),
            ]),
          ),
        ));
  }
}
