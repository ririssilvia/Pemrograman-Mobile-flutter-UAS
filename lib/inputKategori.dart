
import 'package:crud/listKategori.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddKategoriScreen extends StatefulWidget {
  @override
  _AddKategoriScreenState createState() => _AddKategoriScreenState();
}

class _AddKategoriScreenState extends State<AddKategoriScreen> {
  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  TextEditingController nameKategoriController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  Map<String, dynamic> kategoriToAdd;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('kategori');

  addkategori() {
    kategoriToAdd = {
      "nameKategori": nameKategoriController.text,
      "deskripsiKategori": deskripsiController.text,
    };

    collectionReference
        .add(kategoriToAdd)
        .whenComplete(() => print('Added to the database'));
        clearInputText();
  }

  void clearInputText() {
    nameKategoriController.text = "";
    deskripsiController.text = "";

  }

  _buildTextField(TextEditingController controller, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: secondaryColor, border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),

            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         actions: [
            IconButton(
              icon: Icon(
                Icons.folder_open,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>ListKategoriScreen()));
              },
            )
          ],
        title: Text('Add Kategori'),
        //centerTitle: true,
        backgroundColor: Colors.indigo[900],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: primaryColor,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              Text(
                "ADD KATEGORI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              _buildTextField(nameKategoriController, 'Nama Kategori'),
              SizedBox(height: 20),
              _buildTextField(deskripsiController, 'Deskripsi '),
              SizedBox(height: 20),
              // ignore: deprecated_member_use
              FlatButton(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Add to list"),
                ),
                color: logoGreen,
                onPressed: () {
                  addkategori();
                  //clearInputText();
                },
              )
            ],
          ),
        ));
  }
}
