import 'package:crud/inputKategori.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListKategoriScreen extends StatefulWidget {
  @override
  _ListKategoriScreenState createState() => _ListKategoriScreenState();
}

class _ListKategoriScreenState extends State<ListKategoriScreen> {
  Color primaryColor = Color(0xff18203d);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);

  TextEditingController nameKategoriController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();


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

  CollectionReference ref = FirebaseFirestore.instance.collection('kategori');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori List'),
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
      body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    var doc = snapshot.data.docs[index].data;
                    return Card(
                      child: Row(
                        children: <Widget>[
                          // new Container(
                          //   padding: new EdgeInsets.all(5.0),
                          //   child: Image.network(
                          //     doc()['imageUrl'],
                          //     height: 100,
                          //     fit: BoxFit.cover,
                          //     width: 100,
                          //   ),
                          // ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                doc()['nameKategori'],
                                style: TextStyle(color: Colors.black),
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doc()['nameKategori'],
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  Text(
                                    doc()['deskripsiKategori'],
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                              // ),
                              // onTap: () => _navigateToProductInformation(
                              //     context, items[position]),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.visibility_sharp,
                              color: Colors.black,
                            ),
                            onPressed: () {},
                            //: () => _showDialog(context, position),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            color: Colors.grey,
                            onPressed: () {
                              nameKategoriController.text = doc()['nameKategori'];
                              deskripsiController.text = doc()['deskripsiKategori'];
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
                                          new Container(
                                            child: Text(
                                              "Edit Kategori",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          _buildTextField(
                                              nameKategoriController, 'Nama Kategori'),
                                          SizedBox(height: 20),
                                          _buildTextField(deskripsiController,
                                              'Deskripsi '),
                                          SizedBox(height: 20),
                                         
                                          SizedBox(height: 20),
                                          // ignore: deprecated_member_use
                                          FlatButton(
                                            child: Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Text(
                                                  "Update Kategori To Database"),
                                            ),
                                            color: logoGreen,
                                            onPressed: () {
                                              snapshot
                                                  .data.docs[index].reference
                                                  .update({
                                                "nameKategori": nameKategoriController.text,
                                                "deskripsiKategori":
                                                    deskripsiController.text,
                                              }).whenComplete(() =>
                                                      Navigator.pop(context));
                                            },
                                          ),
                                          SizedBox(height: 20),
                                          FlatButton(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Text("Delete Kategori"),
                                              ),
                                              color: Colors.red,
                                              onPressed: () {
                                                snapshot
                                                    .data.docs[index].reference
                                                    .delete();
                                                Navigator.pop(context);
                                              }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      color: Colors.white,
                    );
                  });
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.indigo[700],
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddKategoriScreen(),
              ));
        },
      ),
    );
  }
}
