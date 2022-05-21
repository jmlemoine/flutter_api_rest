import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgets/avatar_button.dart';
import 'package:flutter_api_rest/widgets/circle.dart';
import 'package:flutter_api_rest/widgets/icon_container.dart';
import 'package:flutter_api_rest/widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  //const ({ Key? key }) : super(key: key);

  static const routeName = 'register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    //final Size size = MediaQuery.of(context).size;
    final double pinkSize = responsive.wp(88) /*size.width * 0.8*/;
    final double orangeSize = responsive.wp(57) /*size.width * 0.57*/;

    return Scaffold(
      body: GestureDetector(
          onTap: () {
            //print("Klk");
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: responsive.height /*double.infinity*/,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                      top: -pinkSize * 0.3,
                      right: -pinkSize * 0.2,
                      child: Circle(
                          size: pinkSize,
                          colors: [Colors.pinkAccent, Colors.pink])),
                  Positioned(
                      top: -orangeSize * 0.35,
                      left: -orangeSize * 0.15,
                      child: Circle(
                        size: orangeSize,
                        colors: [Colors.orange, Colors.deepOrangeAccent],
                      )),
                  Positioned(
                    top: pinkSize * 0.22,
                    child: Column(
                      children: <Widget>[
                        /*IconContainer(
                            size: responsive.wp(17) /*size.width * 0.17*/,
                          ),
                          SizedBox(
                            height: responsive.dp(3) /*30*/,
                          ),*/
                        Text(
                          "Hello Again\nWelcome Back!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: responsive.dp(1.6),
                              color: Colors.white),
                        ),
                        SizedBox(height: responsive.dp(4.5)),
                        AvatarButton(imageSize: responsive.wp(25))
                        /*Image(
                            image: AssetImage('assets/avatar.png'),
                            width: 120,
                            height: 120),*/
                      ],
                    ),
                  ),
                  RegisterForm(),
                  Positioned(
                      left: 15,
                      top: 15,
                      child: SafeArea(
                        child: CupertinoButton(
                          color: Colors.black26,
                          padding: EdgeInsets.all(10),
                          borderRadius: BorderRadius.circular(30),
                          child: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ))
                  //RegisterForm()
                ],
              ),
            ),
          )),
    );
  }
}
