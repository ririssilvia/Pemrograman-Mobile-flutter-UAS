import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/database/databaseProduk.dart';
import 'package:crud/screenProduk/detailProduk.dart';
import 'package:crud/screenProduk/editScren.dart';
import 'package:flutter/material.dart';

class ProdukList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: Colors.indigo[200],
                  elevation: 3.0,
                  child: ListTile(
                    leading: Image.network(
                      imageUrl,
                      height: 100,
                      fit: BoxFit.cover,
                      width: 100,
                    ),
                    title: Row(children: [
                      Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(
                          namaProduk,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(right: 10),
                      //   child: Text(
                      //     code,
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.bold, fontSize: 17),
                      //   ),
                      // ),
                    ]),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            kategori,
                           style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        ),
                        // Container(
                        //   padding: EdgeInsets.only(top: 5),
                        //   child: Text(
                        //     deskripsi,
                        //     style: TextStyle(fontSize: 15),
                        //   ),
                        // ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "$harga",
                             style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                          ),
                        
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "$stok",
                            style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                          ),
                        
                        //  Container(
                        //   padding: EdgeInsets.only(top: 5),
                        //   child: Text(
                        //     imageUrl,
                        //     style: TextStyle(fontSize: 15),
                        //   ),
                        // ),
                      ],
                    ),
                    trailing: GestureDetector(
                      // //widget untuk mendeteksi sentuhan
                      // child: Icon(Icons.delete,
                      //  color: Colors.red[800]),

                      // onTap: ()  {
                      //   showDialog(context: context, builder:(context) => AlertDialog(
                      //     title : Text("Delete"),
                      //     content: Text("Are you sure to delete list Produk? "),
                      //     actions: <Widget>[
                      //       FlatButton(onPressed: () {
                      //         Navigator.pop(context);
                      //       }, child: Text("Cancel")),
                      //       FlatButton(onPressed: () async{
                      //         await DatabaseProduk.deleteProduk(docId: docID);
                      //         Navigator.pop(context);
                      //       }, child: Text("Yes"))
                      //     ],
                      //   ));
                      // },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // IconButton(
                          //     icon: Icon(Icons.visibility, color: Colors.black),
                          //     onPressed: () {
                          //       // Navigator.push(
                          //       //     context,
                          //       //     MaterialPageRoute(
                          //       //       builder: (context) =>
                          //       //           DetailProduk(),
                          //       //     ));
                          //     }),
                          //button hapus data
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red[800]),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text("Delete"),
                                        content: Text(
                                            "Are you sure to delete list Produk? "),
                                        actions: <Widget>[
                                          FlatButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel")),
                                          FlatButton(
                                              onPressed: () async {
                                                await DatabaseProduk
                                                    .deleteProduk(docId: docID);
                                                Navigator.pop(context);
                                              },
                                              child: Text("Yes"))
                                        ],
                                      ));
                            },
                          )
                        ],
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditProdukScreen(
                              currentNamaProduk: namaProduk,
                              currentCode: code,
                              currentKategori: kategori,
                              currentDeskripsi: deskripsi,
                              currentHarga: harga,
                              currentStok: stok,
                              currentImageUrl: imageUrl,
                              documentId: docID,
                            ))),
                  ),
                );
              });
        }
      },
    ));
  }
}
