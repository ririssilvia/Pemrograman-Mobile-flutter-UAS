import 'package:crud/list/kategoriList.dart';
import 'package:crud/screenKategori/addScreen.dart';
import 'package:flutter/material.dart';


class DashboardKategoriScreen extends StatefulWidget {
  @override
  _DashboardKategoriState createState() => _DashboardKategoriState();
}

class _DashboardKategoriState extends State<DashboardKategoriScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text("Category"),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreenKategori(),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 10.0,
          ),
          child: KategoriList(),
        ),
      ),
      //drawer: MainDrawer(),
    );
  }
}