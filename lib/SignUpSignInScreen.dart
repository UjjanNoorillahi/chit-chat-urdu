import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpSignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpSignInScreen();
}

class _SignUpSignInScreen extends State<SignUpSignInScreen> {
  String themeColorCodeHexa = "#ffefa541";

  bool isLogIn = false;

  void toggleBetweenSignInAndSignUp() {
    setState(() {
      isLogIn = !isLogIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color themeColor =
        Color(int.parse(themeColorCodeHexa.replaceAll('#', '0x')));
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: EdgeInsets.only(bottom: 90, top: 20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background1.png'),
                fit: BoxFit.cover,
              ),
              // color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150),
                bottomRight: Radius.circular(150),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Color(0xFFDEE06A), // Use the color code provided
                  Color.fromRGBO(
                      144, 106, 224, 0), // Use the color code provided
                ],
                stops: [0.1505, 0.9368],
                transform: GradientRotation(142.03),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: SvgPicture.asset('assets/icons/cake.svg')),
                Text(
                  'Peerlink',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 32),
                )
              ],
            ),
          ),

          isLogIn ? logInCard(themeColor) : signUpCard(themeColor)
          // if (isLogIn)
          //   logInCard(themeColor)
          // else
          //   signUpCard(themeColor) // convert this into ternary operator
        ],
      ),
    );
  }

  Container signUpCard(Color themeColor) {
    return Container(
      padding: EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      height: 450,
      margin: EdgeInsets.only(left: 32, right: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            // offset: Offset(0, 3),
          ),
        ],
        // border: Border.all(
        //   color: Colors.black,
        //   width: 1,
        // ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 35,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: themeColor,
                ),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      toggleBetweenSignInAndSignUp();
                    },
                    child: Container(
                      // height: 30,
                      // width: 110,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: themeColor,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(msg: "Already on SignUp");
                    },
                    child: Container(
                      // height: 30,
                      // width: 110,
                      decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
// -------------------------------------------------------
          SizedBox(
            height: 50,
          ),
          Container(
            height: 20,
            child: TextField(
              decoration: InputDecoration(
                  // filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your Id',
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3), fontSize: 12)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 20,
            child: TextField(
              decoration: InputDecoration(
                  // filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your Password',
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3), fontSize: 12)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 20,
            child: TextField(
              decoration: InputDecoration(
                  // filled: true,
                  fillColor: Colors.white,
                  hintText: 'Confirm your Password',
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3), fontSize: 12)),
            ),
          ),
          SizedBox(
            height: 54,
          ),
          Container(
            height: 35,
            decoration: BoxDecoration(
                color: themeColor, borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account?",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    toggleBetweenSignInAndSignUp();
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container logInCard(Color themeColor) {
    return Container(
      padding: EdgeInsets.only(
        left: 40,
        right: 40,
      ),
      height: 450,
      margin: EdgeInsets.only(left: 32, right: 32),
      // padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            // offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: 35,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: themeColor,
                ),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(msg: "Already on LogIn");
                    },
                    child: Container(
                      // height: 30,
                      // width: 110,
                      decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      toggleBetweenSignInAndSignUp();
                    },
                    child: Container(
                      // height: 30,
                      // width: 110,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: themeColor,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
// -------------------------------------------------------
          SizedBox(
            height: 50,
          ),
          Container(
            height: 20,
            child: TextField(
              decoration: InputDecoration(
                  // filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your Id',
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3), fontSize: 12)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 20,
            child: TextField(
              decoration: InputDecoration(
                  // filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter your Password',
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.3), fontSize: 12)),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forget Password?',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 35,
            decoration: BoxDecoration(
                color: themeColor, borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Text(
                'Log In',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    toggleBetweenSignInAndSignUp();
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
