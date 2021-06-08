import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/database/databaseKategori.dart';
import 'package:crud/database/databaseProduk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProdukForm extends StatefulWidget {
  FocusNode focusNamaProduk = FocusNode();
  FocusNode focusCode = FocusNode();
  FocusNode focusKategori = FocusNode();
  FocusNode focusDeskripsi = FocusNode();
  FocusNode focusHarga = FocusNode();
  FocusNode focusStok = FocusNode();
  FocusNode focusImageUrl = FocusNode();

  AddProdukForm({
    this.focusNamaProduk,
    this.focusCode,
    this.focusKategori,
    this.focusDeskripsi,
    this.focusHarga,
    this.focusStok,
    this.focusImageUrl,
  });
  @override
  AddProdukFormState createState() => AddProdukFormState();
}

class AddProdukFormState extends State<AddProdukForm> {
  final TextEditingController namaProdukController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController stokController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  var selectedCurrency, selectedType;

  final _formPrdoukKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formPrdoukKey,
        child: ListView(physics: BouncingScrollPhysics(), children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
              child: Column(children: <Widget>[
                 StreamBuilder<QuerySnapshot>(
                    stream: DatabaseKatgeori.readKategori(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        const Text("Loading.....");
                      else {
                        List<DropdownMenuItem> currencyKategori = [];
                        for (int i = 0; i < snapshot.data.docs.length; i++) {
                          var snap = snapshot.data.docs[i].data();
                          //String docId = snapshot.data.docs[i].id;
                          String name = snap['namaKategori'];
                          currencyKategori.add(
                            DropdownMenuItem(
                              child: Text(
                                "${name}",
                                style: TextStyle(color: Colors.black),
                              ),
                              value: name,
                            ),
                          );
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(width: 50.0),
                            DropdownButton(
                               dropdownColor: Colors.indigo[50],
                              items: currencyKategori,
                              onChanged: (currencyValue) {
                                final snackBar = SnackBar(
                                  content: Text(
                                    'Selected Currency value is $currencyValue',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                                setState(() {
                                  selectedCurrency = currencyValue;
                                });
                              },
                              value: selectedCurrency,
                              isExpanded: false,
                              hint: new Text(
                                "Pilih Kategori Produk",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        );
                      }
                    }),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: namaProdukController,
                    focusNode: widget.focusNamaProduk,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Nama Produk',
                      icon: Icon(Icons.production_quantity_limits_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: codeController,
                    focusNode: widget.focusCode,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Code Produk',
                      icon: Icon(Icons.code),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: deskripsiController,
                    focusNode: widget.focusDeskripsi,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Deskripsi Produk',
                      icon: Icon(Icons.description),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                  Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                     controller: hargaController,
                    focusNode: widget.focusHarga,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Harga Produk',
                      icon: Icon(Icons.monetization_on),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: stokController,
                    focusNode: widget.focusStok,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Stok Produk',
                      icon: Icon(Icons.shop),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                  Padding(
                  padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: imageUrlController,
                    focusNode: widget.focusImageUrl,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Image URL',
                      icon: Icon(Icons.image),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
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
                            await DatabaseProduk.addProduk(
                                namaProduk: namaProdukController.text,
                                code: codeController.text,
                                kategori: selectedCurrency,
                                deskripsi: deskripsiController.text,
                                harga: int.tryParse(hargaController.text),
                                stok: int.tryParse(stokController.text),
                                imageUrl: imageUrlController.text);

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
              ]
              )
              )
        ]
        )
        );
  }
}
