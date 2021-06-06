import 'package:crud/database/databaseKategori.dart';
import 'package:crud/database/databaseProduk.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crud/Auth/intro/welcome.dart';
import 'package:crud/Auth/register/register.dart';
import 'package:crud/auth/login/Success_screen.dart';
import 'package:crud/mainDrawerlogin.dart';
import 'package:crud/mainNavDrawer.dart';
import 'package:crud/homeScreen/profile.dart';
import 'package:crud/services/auth.dart';
import 'package:crud/services/sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var authHandler = new Auth();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  //tambahkan form untuk validasi form
  final _formKey = GlobalKey<FormState>();
  User user;

  //untuk hidepassword icon
  bool _isHidePassword = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Align(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: size.width,
                height: size.height * 0.1,
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(),
                        ));
                  },
                ),
              ),
            ),
          ),
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: size.height * 0.03),
          Container(
            child: Image.asset(
              'assets/images/login.jpg',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          Container(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      //margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.indigo[100],
                        border: Border.all(
                          color: Colors.indigo,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          icon:
                              Icon(Icons.account_circle, color: Colors.indigo),
                          hintText: "E-mail",
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter an Email Address';
                          } else if (!value.contains('@')) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    // Password TextField
                    Container(
                      //margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      width: size.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.indigo[100],
                        border: Border.all(
                          color: Colors.indigo,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: _passController,
                        focusNode: _passwordFocusNode,
                        obscureText: _isHidePassword,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Password",
                          icon: Icon(
                            Icons.lock,
                            color: Colors.indigo,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              _togglePasswordVisibility();
                            },
                            child: Icon(
                              _isHidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: _isHidePassword
                                  ? Colors.indigo
                                  : Colors.indigo,
                            ),
                          ),
                          isDense: true,
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Password';
                          } else if (value.length < 6) {
                            return 'Password must be atleast 6 characters!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                      color: Colors.indigo[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(30),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          authHandler
                              .signInEmail(
                                  _emailController.text, _passController.text)
                              .then((User user) {
                            if (user != null) {
                                DatabaseKatgeori.userUid =_auth.currentUser.uid;
                                DatabaseProduk.userUid = _auth.currentUser.uid;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    //return SuccessScreen();
                                    return MainNavRegister();
                                  },
                                ),
                              );
                            }
                          });
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Colors.indigo,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "OR",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Divider(
                            thickness: 2,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        // ignore: deprecated_member_use
                        child: OutlineButton(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          color: Colors.black,
                          onPressed: () {
                            signInWithGoogle().then((result) {
                              if (result != null) {
                                DatabaseKatgeori.userUid =_auth.currentUser.uid;
                                DatabaseProduk.userUid = _auth.currentUser.uid;
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ProfileScreen();
                                }));
                              }
                            });
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          highlightElevation: 50,
                          borderSide: BorderSide(
                            color: Colors.indigo[900],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/images/google_logo.png',
                                  height: 25.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "Don’t have account ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo),
                            ),
                            SizedBox(height: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterPage()));
                              },
                              child: Text(
                                "Register here",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
