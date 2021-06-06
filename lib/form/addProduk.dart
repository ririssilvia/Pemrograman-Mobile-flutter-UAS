import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/database/databaseKategori.dart';
import 'package:crud/database/databaseProduk.dart';
import 'package:crud/services/sign_in.dart';
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
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
            
              // SvgPicture.asset(
              //   "icons/add_note.svg",
              //   height: 150,
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.indigo, width: 1),
                      ),
                      child: 
                     ///
                      TextFormField(
                        controller: namaProdukController,
                        focusNode: widget.focusNamaProduk,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 0),
                            labelText: "Nama Produk",
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please fill this section';
                          }
                          return null;
                        },
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.indigo, width: 1),
                      ),
                      child: 
                     ///
                      TextFormField(
                        controller: codeController,
                        focusNode: widget.focusCode,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 0),
                            labelText: "code Produk",
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please fill this section';
                          }
                          return null;
                        },
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    // Container(
                    //   padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                    //   decoration: BoxDecoration(
                    //     color: Colors.indigoAccent,
                    //     borderRadius: BorderRadius.circular(10),
                    //     border: Border.all(color: Colors.indigo, width: 1),
                    //   ),
                    //   child: 
                    //  ///
                    //   TextFormField(
                    //     controller: kategoriController,
                    //     focusNode: widget.focusKategori,
                    //     keyboardType: TextInputType.text,
                    //     cursorColor: Colors.black,
                    //     decoration: InputDecoration(
                    //         contentPadding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 0),
                    //         labelText: "kode Produk",
                    //         border: InputBorder.none),
                    //     validator: (value) {
                    //       if (value.isEmpty) {
                    //         return 'Please fill this section';
                    //       }
                    //       return null;
                    //     },
                    //     maxLines: 1,
                    //   ),
                    // ),
                // SizedBox(height: 40.0),
                //    StreamBuilder<QuerySnapshot>(
                //   stream: FirebaseFirestore.instance.collection("kategori").snapshots(),
                //   builder: (context, snapshot) {
                //     if (!snapshot.hasData)
                //       const Text("Loading.....");
                //     else {
                //       List<DropdownMenuItem> currencyKategori = [];
                //       for (int i = 0; i < snapshot.data.docs.length; i++) {
                //         var snap = snapshot.data.docs[i];
                //         String name = snap['namaKategori'];
                //         currencyKategori.add(
                //             DropdownMenuItem(child: Text(name),
                //             ),
                //             value: selectedCurrency,
                //         );
                //       }
                 SizedBox(height: 40.0),
                 StreamBuilder<QuerySnapshot>(
                  stream:  DatabaseKatgeori.readKategori(),
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
                                DropdownMenuItem(child: Text(name,
                              style: TextStyle( color: Colors.black),
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
                              "Choose Currency Type",
                              style: TextStyle(color: Color(0xff11b719)),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
                    SizedBox(
                      height: 10.0,
                    ),
                      Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.indigo, width: 1),
                      ),
                      child: 
                     ///
                      TextFormField(
                        controller: deskripsiController,
                        focusNode: widget.focusDeskripsi,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 0),
                            labelText: "deskripsi Produk",
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please fill this section';
                          }
                          return null;
                        },
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                     Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.indigo, width: 1),
                      ),
                      child: 
                     ///
                      TextFormField(
                        controller: hargaController,
                        focusNode: widget.focusHarga,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 0),
                            labelText: "Harga Produk",
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please fill this section';
                          }
                          return null;
                        },
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                     Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.indigo, width: 1),
                      ),
                      child: 
                     ///
                      TextFormField(
                        controller: stokController,
                        focusNode: widget.focusStok,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 0),
                            labelText: "Stok Produk",
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please fill this section';
                          }
                          return null;
                        },
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                     Container(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                      decoration: BoxDecoration(
                        color: Colors.indigoAccent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.indigo, width: 1),
                      ),
                      child: 
                     ///
                      TextFormField(
                        controller:imageUrlController,
                        focusNode: widget.focusImageUrl,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 0),
                            labelText: "Image url",
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please fill this section';
                          }
                          return null;
                        },
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                   
              
              Container(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: RawMaterialButton(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text("Add data",
                            style: TextStyle(
                                color: Colors.indigoAccent, fontSize: 18.0)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        elevation: 5.0,
                        fillColor: Colors.indigo,
                        onPressed: () async {
                          await DatabaseProduk.addProduk(
                              namaProduk: namaProdukController.text,
                              code:  codeController.text,
                              kategori: kategoriController.text,
                              deskripsi: deskripsiController.text,
                              harga: int.tryParse(hargaController.text),
                              stok: int.tryParse(stokController.text),
                              imageUrl: imageUrlController.text
                              );
                         
                          Navigator.of(context).pop();
                        }),
                  ))
            ]
          )
              )
            ]
              )
          );   
  }
}
