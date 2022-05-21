import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = "", _password = "";

  _submit() {
    final isOk = _formKey.currentState!.validate();
    print("Form isOk $isOk");
    //if (isOk) {}
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
              SizedBox(height: responsive.dp(2)),
              Container(
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
              ),
              SizedBox(height: responsive.dp(5)),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  child: Text(
                    "Sign In",
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
                    "New User?",
                    style: TextStyle(fontSize: responsive.dp(1.5)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child: Text(
                      "Sign Up",
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
