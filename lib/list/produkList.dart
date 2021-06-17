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
                    child: Row(children: <Widget>[
                      new Container(
                          padding: new EdgeInsets.all(5.0),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.fill,
                            height: 125,
                            width: 125,
                          )),
                      Expanded(
                        child: ListTile(
                            title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, top: 1),
                            child: Text(
                              kategori,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.indigo[900]),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(top: 1),
                            child: Text(
                             namaProduk,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Harga :$harga",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Stok :$stok",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Deskripsi :$deskripsi",
                                  maxLines: 4,
                                   overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          trailing: GestureDetector(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //button hapus data
                                IconButton(
                                  icon: Icon(Icons.delete,
                                      color: Colors.red[800]),
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
                                                          .deleteProduk(
                                                              docId: docID);
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
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
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
                      )
                    ]));
              }
              );
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.black,
            ),
          ),
        );
      },
    )
    );
  }
}
