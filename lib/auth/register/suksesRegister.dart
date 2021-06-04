import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:crud/auth/intro/welcome.dart';
import 'package:crud/services/auth.dart';
import 'package:crud/services/sign_in.dart';


class SuksesRegisterScreen extends StatefulWidget {
  @override
  _SuksesRegisterScreenState createState() => _SuksesRegisterScreenState();
}

class _SuksesRegisterScreenState extends State<SuksesRegisterScreen> {
  var authHandler = new Auth();
  final FirebaseAuth auth = FirebaseAuth.instance;
 
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.indigo[100], Colors.indigo[400]],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'registration success',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
                CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://clubsports.gcu.edu/wp-content/uploads/Coach-Avator.png"
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
             
              // SizedBox(height: 40),
              // Text(
              //   'NAME',
              //   style: TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.black54),
              // ),
              // Text(
              //    name,
              //   style: TextStyle(
              //       fontSize: 25,
              //       color: Colors.deepPurple,
              //       fontWeight: FontWeight.bold),
              // ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                auth.currentUser.email,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              // ignore: deprecated_member_use
              RaisedButton(
              onPressed: () async {
                    await authHandler.signOut();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new WelcomeScreen()));
                  },
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}