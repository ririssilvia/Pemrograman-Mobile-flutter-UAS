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
  return  Form(
          key: _formCategoryKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(height: 30,),
          //     SvgPicture.asset(
          //   "icons/add_category.svg",
          //   height: 200,
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
                      child: TextFormField(
                        controller: namaKategoriController,
                        focusNode: widget.focusNamaKategori,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 0),
                            labelText: "Nama Kategori",
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Kategori';
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
                        border: Border.all(color:Colors.indigo, width: 1),
                      ),
                      child: TextFormField(
                        controller:deskripsiController,
                        focusNode: widget.focusDeskripsi,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 5.0, 5.0, 0),
                            labelText: "Deskripsi Kategori",
                            border: InputBorder.none),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter this section';
                          }
                          return null;
                        },
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60,),
              Container(
                padding: EdgeInsets.all(20),
                  child: SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: RawMaterialButton(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text("Add data",
                        style: TextStyle(
                            color: Colors.indigo, fontSize: 18.0)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    elevation: 5.0,
                    fillColor: Colors.black,
                    onPressed: ()async{
                      await DatabaseKatgeori.addKategori(
                        namaKategori : namaKategoriController.text,
                        deskripsi : deskripsiController.text
                      );
                      Navigator.of(context).pop();
                    }),
              ))
            ],
          ),
        );
  }
}
