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
        appBar: AppBar(
          title: Text('Detail Produk'),
          backgroundColor: Colors.indigo,
        ),
        body: Container(
            child: StreamBuilder<QuerySnapshot>(
          stream: DatabaseProduk.readProduk(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            } else if (snapshot.hasData || snapshot.data != null) {
              return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 5.0),
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
                                height: 100,
                                fit: BoxFit.cover,
                                width: 100,
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
