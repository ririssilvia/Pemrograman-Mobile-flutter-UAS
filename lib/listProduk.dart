import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListProdukScreen extends StatefulWidget {
  @override
  _ListProdukScreenState createState() => _ListProdukScreenState();
}

class _ListProdukScreenState extends State<ListProdukScreen> {
  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

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

  CollectionReference ref = FirebaseFirestore.instance.collection('produk');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: primaryColor,
        body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var doc = snapshot.data.docs[index].data;
                    return ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.edit),
                        color: Colors.white,
                        onPressed: () {
                          nameController.text = doc()['name'];
                          codeController.text = doc()['code'];
                          deskripsiController.text = doc()['deskripsi'];
                          hargaController.text = doc()['harga'];
                          stokController.text = doc()['stok'];
                          imageUrlController.text = doc()['imageUrl'];
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                    child: Container(
                                      color: primaryColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListView(
                                          shrinkWrap: true,
                                          children: [
                                            _buildTextField(
                                                nameController, 'Nama Produk'),
                                            SizedBox(height: 20),
                                            _buildTextField(
                                                codeController, 'Code '),
                                            SizedBox(height: 20),
                                            _buildTextField(deskripsiController,
                                                'Deskripsi '),
                                            SizedBox(height: 20),
                                            _buildTextField(
                                                hargaController, 'Harga '),
                                            SizedBox(height: 20),
                                            _buildTextField(
                                                stokController, 'Stok '),
                                            SizedBox(height: 20),
                                            _buildTextField(imageUrlController,
                                                'image Url '),
                                            SizedBox(height: 20),
                                            // ignore: deprecated_member_use
                                            FlatButton(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Text(
                                                    "Update Product To Database"),
                                              ),
                                              color: logoGreen,
                                              onPressed: () {
                                                snapshot
                                                    .data.docs[index].reference
                                                    .update({
                                                  "name": nameController.text,
                                                  "code": codeController.text,
                                                  "deskripsi":deskripsiController.text,
                                                  "harga": hargaController.text,
                                                  "stok": stokController.text,
                                                  "imageUrl":imageUrlController.text,
                                                }).whenComplete(() => Navigator.pop(context));
                                              },
                                            ),
                                            SizedBox(height: 20),
                                            FlatButton(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Text("Delete Product"),
                                              ),
                                              color: Colors.red,
                                              onPressed: () {
                                                snapshot
                                                    .data.docs[index].reference.delete();
                                                    Navigator.pop(context);
                                              }
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                        },
                      ),
                      title: Text(
                        doc()['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Column(
                        children: [
                          Text(
                            doc()['code'],
                            style: TextStyle(color: Colors.blue),
                          ),
                          Text(
                            doc()['deskripsi'],
                            style: TextStyle(color: Colors.blue),
                          ),
                          Text(
                            doc()['harga'],
                            style: TextStyle(color: Colors.blue),
                          ),
                          Text(
                            doc()['stok'],
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      trailing: Image.network(
                        doc()['imageUrl'],
                        height: 100,
                        fit: BoxFit.cover,
                        width: 100,
                      ),
                    );
                  });
            } else
              return Text('');
          },
        ));
  }
}
