import 'package:crud/list/kategoriList.dart';
import 'package:crud/screenKategori/addScreen.dart';
import 'package:crud/screenKategori/detailKategori.dart';
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
            actions: [
            IconButton(
              icon: Icon(
                Icons.folder_open,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>DetailKategori()));
              },
            )
          ],
          elevation: 0,
          backgroundColor: Colors.indigo,
          title: Text("Kategori"),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreenKategori(),
            ),
          );
        },
        backgroundColor: Colors.indigo,
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