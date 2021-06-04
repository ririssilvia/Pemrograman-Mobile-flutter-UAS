import 'package:crud/auth/intro/welcome.dart';
import 'package:crud/inputProduk.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() {
//   runApp(MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
    //   theme: ThemeData(
    //     primaryColor:Colors.indigo,
    //     scaffoldBackgroundColor: Color(0xff18203d),
    //   ),
    //  home: AddProdukScreen(),
    theme: ThemeData(
        primaryColor:Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),
     home: WelcomeScreen(),
      
    );
  }
}