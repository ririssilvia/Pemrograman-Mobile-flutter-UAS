import 'package:crud/screenKategori/dashboardKategori.dart';
import 'package:crud/screenProduk/dashboardProduk.dart';
import 'package:flutter/material.dart';
import 'package:crud/homeScreen/profile.dart';
import 'package:crud/services/sign_in.dart';

import 'Auth/intro/welcome.dart';

class MainNavDrawer extends StatelessWidget {
  const MainNavDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      UserAccountsDrawerHeader(
        accountName:  Text(
                name,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
        accountEmail: Text(
               email,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
        currentAccountPicture: GestureDetector(
            onTap: () {
              Navigator.push(
                            context,
                            MaterialPageRoute(
                             
                              //builder: (context) => MainDrawer(),
                              builder: (context) => ProfileScreen(),
                            ));
            },
            child:CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 50,
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
                             
                              builder: (context) => DashboardProdukScreen(),
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
                             
                              builder: (context) => DashboardKategoriScreen(),
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
          height: 250,
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
           onTap: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return WelcomeScreen();
                  }), ModalRoute.withName('/'));
                },
      ),
      Divider(
        color: Colors.grey,
        height: 30,
        thickness: 1,
        indent: 26,
        endIndent: 26,
      ),
    ]));
  }
}