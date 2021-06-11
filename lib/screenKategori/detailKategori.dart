import 'package:crud/database/databaseKategori.dart';
import 'package:crud/database/databaseProduk.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailKategori extends StatefulWidget {
  @override
  _DetailKategoriState createState() => _DetailKategoriState();
}

class _DetailKategoriState extends State<DetailKategori> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
     //backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.indigo,
          title: Text("Detail Kategori"),
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
      stream: DatabaseKatgeori.readKategori(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 5.0),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                var kategoriInfo = snapshot.data.docs[index].data();
                String docID = snapshot.data.docs[index].id;
                String namaKategori = kategoriInfo['namaKategori'];
                String deskripsi = kategoriInfo['deskripsi'];

                    return Card(
                      color: Colors.indigo[100],
                      elevation: 3.0,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "DETAIL KATEGORI",
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
                              "Name Kategori: $namaKategori",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                            ),
                            Divider(
                              thickness: 3,
                            ),
                            new Text(
                              "Deskripsi Produk : $deskripsi",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                            ),
                            Divider(
                              thickness: 3,
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
