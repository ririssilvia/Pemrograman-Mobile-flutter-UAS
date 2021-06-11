import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/database/databaseKategori.dart';
import 'package:crud/screenKategori/editScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KategoriList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: Colors.indigo[200],
                  elevation: 3.0,
                  child: ListTile(
                      // leading: CircleAvatar(
                      //   backgroundColor: Colors.indigo,
                      //   child: Icon(
                      //     Icons.category,
                      //     color: Colors.lightBlue,
                      //   ),
                      // ),
                      leading: Image.network(
                          "https://cdn0.iconfinder.com/data/icons/infographic-orchid-vol-1/256/Colorful_Label-512.png"),
                      title: Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          namaKategori,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, //horizontal
                        mainAxisAlignment: MainAxisAlignment.start, //vertical
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              deskripsi,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      trailing: GestureDetector(
                        //widget untuk mendeteksi sentuhan
                        child: Icon(Icons.delete,
                        size: 35,
                        color: Colors.red[800],),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("Delete"),
                                    content: Text(
                                        "Are you sure to delete  category ? "),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel")),
                                      FlatButton(
                                          onPressed: () async {
                                            await DatabaseKatgeori
                                                .deleteKategori(docId: docID);
                                            Navigator.pop(context);
                                          },
                                          child: Text("Yes"))
                                    ],
                                  ));
                        },
                      ),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditKategoriScreen(
                              currentNamaKategori: namaKategori,
                              currentDeskripsi: deskripsi,
                              documentId: docID,
                            ),
                          ))),
                );
              });
        }
      },
    ));
  }
}
