import 'package:crud/listProduk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProdukScreen extends StatefulWidget {
  @override
  _AddProdukScreenState createState() => _AddProdukScreenState();
}

class _AddProdukScreenState extends State<AddProdukScreen> {
  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  Map<String, dynamic> productToAdd;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('produk');

  addproduct() {
    productToAdd = {
      "name": nameController.text,
      "code": codeController.text,
      "deskripsi": deskripsiController.text,
      "harga": hargaController.text,
      "stok": stokController.text,
      "imageUrl": imageUrlController.text,
    };

    collectionReference
        .add(productToAdd)
        .whenComplete(() => print('Added to the database'));
    clearInputText();
  }

  void clearInputText() {
    nameController.text = "";
    codeController.text = "";
    deskripsiController.text = "";
    hargaController.text = "";
    stokController.text = "";
    imageUrlController.text = "";
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.folder_open,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>ListProdukScreen()));
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              Text(
                "ADD PRODUK",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              _buildTextField(nameController, 'Nama Produk'),
              SizedBox(height: 20),
              _buildTextField(codeController, 'Code '),
              SizedBox(height: 20),
              _buildTextField(deskripsiController, 'Deskripsi '),
              SizedBox(height: 20),
              _buildTextField(hargaController, 'Harga '),
              SizedBox(height: 20),
              _buildTextField(stokController, 'Stok '),
              SizedBox(height: 20),
              _buildTextField(imageUrlController, 'image Url '),
              SizedBox(height: 20),
              // ignore: deprecated_member_use
              FlatButton(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Add to list"),
                ),
                color: logoGreen,
                onPressed: () {
                  addproduct();
                  //clearInputText();
                },
              )
            ],
          ),
        ));
  }
}
