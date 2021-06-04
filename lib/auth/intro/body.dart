import 'package:flutter/material.dart';
import 'package:crud/Auth/intro/background.dart';
import 'package:crud/Auth/login/login.dart';
import 'package:crud/Auth/register/register.dart';


class BodyWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome Shop ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                fontFamily: 'Pattaya',
                ),
            ),
            Text(
              "Technology",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Pattaya',
                ),
            ),
            SizedBox(height: size.height * 0.05),
            // SvgPicture.asset(
            //   "assets/icons/chat.svg",
            //   height: size.height * 0.45,
            // ),
             Hero(
              tag: 'logoAnimation',
              child: Image.asset(
                'assets/images/welcome.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.05),
      Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
               // ignore: deprecated_member_use
               child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    color: Colors.indigo[800],
                   onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                             
                              builder: (context) => LoginPage(),
                            ));
                      },
                    child:Text('Login', style: TextStyle(fontSize: 20, color: Colors.white),) ,),
              ),
              SizedBox(height: size.height * 0.02),
               Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
               // ignore: deprecated_member_use
               child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    color: Colors.indigo[100],
                    onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ));
                      },
                    child:Text('Register', style: TextStyle(fontSize: 17, color: Colors.black),) ,),
              ),
          ],
        ),
      ),
    );
  }
}