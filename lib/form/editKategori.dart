import 'package:crud/database/databaseKategori.dart';
import 'package:flutter/material.dart';

class EditKategoriForm extends StatefulWidget {
  final FocusNode focusNamaKategori;
  final FocusNode focusDeskripsi;
  final String currentNamaKategori;
  final String currentDeskripsi;
  final String documentId;

  const EditKategoriForm({
    this.focusNamaKategori,
    this.focusDeskripsi,
    this.currentNamaKategori,
    this.currentDeskripsi,
    this.documentId,
  });
  @override
  EditKategoriFormState createState() => EditKategoriFormState();
}

class EditKategoriFormState extends State<EditKategoriForm> {
  final _editkategoriKey = GlobalKey<FormState>();
  TextEditingController namaKategoriController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  @override
  void initState() {
    namaKategoriController =
        TextEditingController(text: widget.currentNamaKategori);
    deskripsiController = TextEditingController(text: widget.currentDeskripsi);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Form(
      key: _editkategoriKey,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
               child: Image.asset(
              'assets/images/up.jpg',
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
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
                      await DatabaseKatgeori.updateKategori(
                          docId: widget.documentId,
                          namaKategori: namaKategoriController.text,
                          deskripsi: deskripsiController.text);
                      Navigator.of(context).pop();
                    },
                    backgroundColor: Colors.indigo,
                    icon: Icon(Icons.update),
                    label: Text(
                      'update data',
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
