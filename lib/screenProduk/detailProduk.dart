import 'package:crud/database/databaseProduk.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailProduk extends StatefulWidget {
  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
     //backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.indigo,
          title: Text("Detail Produk"),
        ),
        body: Container(
           decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.indigo, Colors.indigo],
          ),
        ),
        
            child: StreamBuilder<QuerySnapshot>(
              
          stream: DatabaseProduk.readProduk(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.hasData || snapshot.data != null) {
              return ListView.separated(
                  separatorBuilder: (context, index) => 
                  SizedBox(height: 10),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var produkInfo = snapshot.data.docs[index].data();
                    String docID = snapshot.data.docs[index].id;
                    String namaProduk = produkInfo['namaproduk'];
                    String code = produkInfo['code'];
                    String kategori = produkInfo['kategori'];
                    String deskripsi = produkInfo['deskripsi'];
                    int harga = produkInfo['harga'];
                    int stok = produkInfo['stok'];
                    String imageUrl = produkInfo['imageUrl'];

                    return Card(
                      color: Colors.indigo[100],
                      elevation: 3.0,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "DETAIL PRODUK",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            //          Expanded(
                            //   child: Container(
                            //     height: 2,
                            //   ),
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            
                            new Text(
                              "Name : $namaProduk",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                            ),
                            Divider(
                              thickness: 3,
                            ),
                            new Text(
                              "Code produk : $code",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                            ),
                            Divider(
                              thickness: 3,
                            ),
                            new Text(
                              "Kategori produk : $kategori",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                            ),
                            Divider(
                              thickness: 3,
                            ),
                            new Text(
                              "Description : $deskripsi",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                            ),
                            Divider(
                              thickness: 3,
                            ),
                            new Text(
                              "Price : $harga",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                            ),
                            Divider(
                              thickness: 3,
                            ),
                            new Text(
                              "Stock : $stok",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                            ),
                            Divider(
                              thickness: 3,
                            ),
                            Container(
                              height: 300.0,
                              width: 300.0,
                              child: Center(
                                  child: Image.network(
                                imageUrl,
                                height: 200,
                                fit: BoxFit.cover,
                                width: 200,
                              )),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        )));
  }
}
