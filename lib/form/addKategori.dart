import 'package:crud/database/databaseKategori.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddKategoriForm extends StatefulWidget {
  FocusNode focusNamaKategori = FocusNode();
  FocusNode focusDeskripsi = FocusNode();

  AddKategoriForm({
    this.focusNamaKategori,
    this.focusDeskripsi,
  });

  @override
  AddKategoriFormState createState() => AddKategoriFormState();
}

class AddKategoriFormState extends State<AddKategoriForm> {
  final TextEditingController namaKategoriController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  final _formCategoryKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formCategoryKey,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            child: Image.asset(
              'assets/images/ad.jpg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: namaKategoriController,
                    focusNode: widget.focusNamaKategori,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nama Kategori',
                      icon: Icon(Icons.category),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: deskripsiController,
                    focusNode: widget.focusDeskripsi,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Deskripsi Kategori',
                      icon: Icon(Icons.description),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: FloatingActionButton.extended(
                    //button with an optional icon and label
                    onPressed: () async {
                      await DatabaseKatgeori.addKategori(
                          namaKategori: namaKategoriController.text,
                          deskripsi: deskripsiController.text);
                      Navigator.of(context).pop();
                    },
                    backgroundColor: Colors.indigo,
                    icon: Icon(Icons.archive_outlined),
                    label: Text(
                      'add data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Container(
                  width: 30,
                ),
                // tombol batal
                Container(
                  child: FloatingActionButton.extended(
                    //button with an optional icon and label
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.red,
                    icon: Icon(Icons.cancel_schedule_send),
                    label: Text(
                      'Cancel',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
