import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crud/Auth/intro/welcome.dart';
import 'package:crud/auth/register/suksesRegister.dart';
import 'package:crud/services/auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //TextEditingController _namaController = new TextEditingController();
  TextEditingController _namaController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  //tambahkan form untuk validasi form
  final _formKey = GlobalKey<FormState>();
   var authHandler = new Auth();

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
        padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
              "REGISTER",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              child: Image.asset(
                'assets/images/Register.jpg',
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
                          controller: _namaController,
                          keyboardType: TextInputType.name,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            icon: Icon(Icons.person_add,
                                color: Colors.indigo),
                            hintText: "Nama",
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter an Name';
                            } 
                            return null;
                          },
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.all(10),
                      ),
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
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            icon: Icon(Icons.account_circle,
                                color: Colors.indigo),
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
                         onPressed: () {
                                authHandler
                                    .createUserWithEmail(_emailController.text,
                                        _passController.text)
                                    .then((User user) {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new SuksesRegisterScreen()));
                                }).catchError((e) => print(e));
                              },
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 30),
                      
                     
                      
                    ],
                  ),
                )
                )
          ],
        ),
      ),
    );
  }
}
