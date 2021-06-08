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
        title: Text('Detail PRoduk'),
        backgroundColor: Colors.indigo,
      ),
      body:Container(
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
                
                  // child: ListTile(
                  //   leading: Image.network(
                  //     imageUrl,
                  //     height: 100,
                  //     fit: BoxFit.cover,
                  //     width: 100,
                  //   ),
                  //   title: Row(children: [
                  //     Container(
                  //       padding: EdgeInsets.only(right: 5),
                  //       child: Text(
                  //         namaProduk,
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold, fontSize: 17),
                  //       ),
                  //     ),
                  //     Container(
                  //       padding: EdgeInsets.only(right: 10),
                  //       child: Text(
                  //         code,
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold, fontSize: 17),
                  //       ),
                  //     ),
                  //   ]),
                  //   subtitle: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         padding: EdgeInsets.only(top: 5),
                  //         child: Text(
                  //           kategori,
                  //           style: TextStyle(fontSize: 10),
                  //         ),
                  //       ),
                  //       Container(
                  //         padding: EdgeInsets.only(top: 5),
                  //         child: Text(
                  //           deskripsi,
                  //           style: TextStyle(fontSize: 15),
                  //         ),
                  //       ),
                  //       Container(
                  //         padding: EdgeInsets.only(top: 5),
                  //         child: Text(
                  //           "$harga",
                  //           style: TextStyle(fontSize: 15),
                  //         ),
                  //       ),
                  //       Container(
                  //         padding: EdgeInsets.only(top: 5),
                  //         child: Text(
                  //           "$stok",
                  //           style: TextStyle(fontSize: 15),
                  //         ),
                  //       ),
                  //       //  Container(
                  //       //   padding: EdgeInsets.only(top: 5),
                  //       //   child: Text(
                  //       //     imageUrl,
                  //       //     style: TextStyle(fontSize: 15),
                  //       //   ),
                  //       // ),
                  //     ],
                  //   ),
                    
                  
                  //           ),
                  child: Center(
            child: Column(
              children: <Widget>[                
                new Text("Name : $namaProduk", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Code produk : $code", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Kategori produk : $kategori", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Description : $deskripsi", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Price : $harga", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Stock : $stok", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                Container(
                          height: 300.0,
                          width: 300.0,
              child: Center(
                child: Image.network(
                  imageUrl,
                      height: 100,
                      fit: BoxFit.cover,
                      width: 100,
                )
              ),
            ),
              ],
            ),
          ),
                  
                );
              });
        }
      },
        )
      )
    );
  }
}
 
