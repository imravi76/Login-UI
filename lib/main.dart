import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Nunito"
      ),
      home: Scaffold(
        body: Container(
          child: LoginPage(),
        ),
      ),

    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFF40284A);

  double _loginWidth = 0;

  double _headingTop = 100;

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;

  double windowWidth = 0;
  double windowHeight = 0;

  double _loginOpacity = 1;

  @override
  Widget build(BuildContext context) {

    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;

    switch(_pageState){
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFF40284A);

        _headingTop = 100;

        _loginWidth = windowWidth;
        _loginXOffset = 0;

        _loginYOffset = windowHeight;
        _registerYOffset = windowHeight;

        _loginOpacity = 1;
        break;

      case 1:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;

        _headingTop = 90;

        _loginWidth = windowWidth;
        _loginXOffset = 0;

        _loginYOffset = 270;
        _registerYOffset = windowHeight;

        _loginOpacity = 1;
        break;

      case 2:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;

        _headingTop = 80;

        _loginWidth = windowWidth - 40;
        _loginXOffset = 20;

        _loginYOffset = 240;
        _registerYOffset = 270;

        _loginOpacity = 0.7;
        break;
    }

    return Stack(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          color: _backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: (){

                  setState(() {
                    _pageState = 0;
                  });

                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.fastLinearToSlowEaseIn,
                        margin: EdgeInsets.only(
                            top: _headingTop,
                        ),
                          child: Text(
                              "Learn with IoTian Hub",
                            style: TextStyle(
                              color: _headingColor,
                              fontSize: 28
                            ),
                          )
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                            "We make learning easy. Join IoTian Hub to learn IoT for free.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: _headingColor,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 14,
                ),
                child: Center(
                  child: Image.asset("assets/images/login_bg.png"),
                ),
              ),

              Container(
                child: GestureDetector(

                  onTap: (){
                    setState(() {
                      if(_pageState != 0){
                        _pageState = 0;
                      } else {
                        _pageState = 1;
                      }
                    });
                  },

                  child: Container(
                    margin: EdgeInsets.all(32),
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        AnimatedContainer(

          width: _loginWidth,
          padding: EdgeInsets.all(32),
          duration: Duration(
            milliseconds: 1000,
          ),
          curve: Curves.fastLinearToSlowEaseIn,
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(_loginOpacity),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            )
          ),
          child: Column(
            children:<Widget> [
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Login to Continue",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),

                  InputWithIcon(
                    icon: Icons.email,
                    hint: "Enter Email....",
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter Password....",
                  ),

                  SizedBox(
                    height: 120,
                  ),

                ],
              ),
              Column(
                children: <Widget> [
                  PrimaryButton(
                    btnText: "Login",
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _pageState = 2;
                      });
                    },
                    child: OutlineButton(
                      btnText: "Create New Account",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),

        AnimatedContainer(
          padding: EdgeInsets.all(32),
          duration: Duration(
            milliseconds: 1000,
          ),
          curve: Curves.fastLinearToSlowEaseIn,
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              )
          ),
          child: Column(
            children:<Widget> [
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Create a New Account",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),

                  InputWithIcon(
                    icon: Icons.email,
                    hint: "Enter Email....",
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  InputWithIcon(
                    icon: Icons.vpn_key,
                    hint: "Enter Password....",
                  ),

                  SizedBox(
                    height: 120,
                  ),

                ],
              ),
              Column(
                children: <Widget> [
                  PrimaryButton(
                    btnText: "Create Account",
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _pageState = 1;
                      });
                    },
                    child: OutlineButton(
                      btnText: "Back To Login",
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class InputWithIcon extends StatefulWidget {

  var icon;
  String hint;

  InputWithIcon({this.icon, this.hint});

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.orangeAccent,
          width: 2
        ),
        borderRadius: BorderRadius.circular(10)
      ),

      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            child: Icon(
              widget.icon,
              size: 15,
              color: Colors.black26,
            ),
          ),

          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: widget.hint,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 20)
              ),
            ),
          )
        ],
      ),
    );
  }
}


class PrimaryButton extends StatefulWidget {

  final String btnText;
  PrimaryButton({this.btnText});

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(

          widget.btnText,

          style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}

class OutlineButton extends StatefulWidget {

  final String btnText;
  OutlineButton({this.btnText});

  @override
  _OutlineButtonState createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<OutlineButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.orangeAccent,
          width: 2
        ),
        
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(20),

      child: Center(
        child: Text(
          widget.btnText,
          style: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}



