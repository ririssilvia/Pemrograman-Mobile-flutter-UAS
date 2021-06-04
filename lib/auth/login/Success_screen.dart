import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:crud/auth/intro/welcome.dart';
import 'package:crud/homeScreen/homeKategori.dart';
import 'package:crud/homeScreen/homeProduct.dart';
import 'package:crud/services/auth.dart';


class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
 var authHandler = new Auth();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome '),
      ),
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
                'Hallo',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
             
              SizedBox(height: 40),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://clubsports.gcu.edu/wp-content/uploads/Coach-Avator.png"
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
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
      drawer: _buildDrawer(),
     // endDrawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    return SizedBox(
      width: MediaQuery.of(context).size.width/1.2,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             UserAccountsDrawerHeader(
        accountName:  Text(
                "Admin",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
        accountEmail: Text(
               auth.currentUser.email,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
        currentAccountPicture: GestureDetector(
            onTap: () {
              Navigator.push(
                            context,
                            MaterialPageRoute(
                             
                              //builder: (context) => MainDrawer(),
                              builder: (context) =>SuccessScreen(),
                            ));
            },
            child:CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://clubsports.gcu.edu/wp-content/uploads/Coach-Avator.png"
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
            ),   
      ),
           ListTile(
          leading: Icon(
            Icons.add_chart_rounded,
            color: Colors.indigo[900],
            size: 35,
          ),
          title: Text("Product"),
          onTap: () {
          Navigator.push(
                            context,
                            MaterialPageRoute(
                             
                              builder: (context) => ListViewProduct(),
                            ));
        }
          ),
          Divider(
        color: Colors.grey,
        height: 30,
        thickness: 1,
        indent: 26,
        endIndent: 26,
      ),
       ListTile(
        leading: Icon(
          Icons.category,
          color: Colors.indigo[900],
          size: 35,
        ),
        title: Text("Kategori"),
        onTap: () {
          Navigator.push(
                            context,
                            MaterialPageRoute(
                             
                              builder: (context) => ListViewKategori(),
                            ));
        }
      ),
      Divider(
        color: Colors.grey,
        height: 30,
        thickness: 1,
        indent: 26,
        endIndent: 26,
      ),
      Expanded(
        child: Container(
          height: 300,
        ),
      ),
      Divider(
        color: Colors.grey,
        height: 30,
        thickness: 1,
        indent: 26,
        endIndent: 26,
      ),
      ListTile(
        leading: Icon(
          Icons.exit_to_app,
          color: Colors.indigo[900],
          size: 35,
        ),
        title: Text("Log Out"),
         onTap: () async {
                    await authHandler.signOut();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new WelcomeScreen()));
                  },
      ),
      Divider(
        color: Colors.grey,
        height: 30,
        thickness: 1,
        indent: 26,
        endIndent: 26,
      ),
          ]
        )

      )
    );
    
  }
  }