import 'package:crud/list/produkList.dart';
import 'package:crud/screenProduk/addScreen.dart';
import 'package:flutter/material.dart';


class DashboardProdukScreen extends StatefulWidget {
  @override
  _DashboardProdukScreenState createState() => _DashboardProdukScreenState();
}

class _DashboardProdukScreenState extends State<DashboardProdukScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.indigo,
          title: Text("Produk"),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddProdukScreen(),
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
          child: ProdukList(),
        ),
      ),
      //drawer: MainDrawer(),
    );
  }
}