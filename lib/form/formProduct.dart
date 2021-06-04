import 'package:flutter/material.dart';




class FormProductScreen extends StatefulWidget {
 
  @override
  _FormProductScreenState createState() => _FormProductScreenState();
}



class _FormProductScreenState extends State<FormProductScreen> {

 

  TextEditingController _nameController;
  TextEditingController _codebarController;
  TextEditingController _descriptionController;
  TextEditingController _priceController;
  TextEditingController _stockController;
  
   //nuevo imagen
  

 


  
  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }
  //fin nuevo imagen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Add Products'),
        backgroundColor: Colors.indigo[900],
      ),
      body: SingleChildScrollView(
       
        //height: 570.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.blueAccent)),
                      padding: new EdgeInsets.all(5.0),
                     // child: image == null ? Text('Add') : Image.file(image),                      
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.2),
                      child: new Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: new BoxDecoration(
                            border: new Border.all(color: Colors.blueAccent)),
                        padding: new EdgeInsets.all(5.0),
                       // child: productImage == '' ? Text('Edit') : Image.network(productImage+'?alt=media'),
                      ),
                    ),
                    Divider(),
                    //nuevo para llamar imagen de la galeria o capturarla con la camara
                    new IconButton(
                        icon: new Icon(Icons.camera_alt), 
                        //onPressed: pickerCam),
                    ),
                    Divider(),
                    new IconButton(
                        icon: new Icon(Icons.image)), 
                        //onPressed: pickerGallery),
                  ],
                ),
                TextField(
                  controller: _nameController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Name'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _codebarController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person), labelText: 'CodeBar'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _descriptionController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.list), labelText: 'Description'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Divider(),
                TextField(
                  controller: _priceController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.monetization_on), labelText: 'Price'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                TextField(
                  controller:_stockController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                  labelText: 'Stock',
                    icon: Icon(Icons.shop),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 1.0),
                ),
                Divider(),
                // FlatButton(
                //     onPressed: () {
                //       //nuevo imagen
                
                    
                //     },
                //     child: (widget.product.id != null)
                //         ? Text('Update')
                //         : Text('Add')),
                Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Container(
                      child: FloatingActionButton.extended(
                        //button with an optional icon and label
                          onPressed: () {
                          // if (mahasiswa == null) {
                          //   // tambah data
                          //   mahasiswa = Mahasiswa(
                          //       nimController.text,
                          //       namaController.text,
                          //       listmataKuliah[indexList].toString(),
                          //       jenisKelaminController.text,
                          //       alamatController.text);
                          // } else {
                          //   // ubah data
                          //   mahasiswa.nim = nimController.text;
                          //   mahasiswa.nama = namaController.text;
                          //   mahasiswa.ambilMatkul = listmataKuliah[indexList].toString();
                          //   mahasiswa.jenisKelamin =jenisKelaminController.text;
                          //   mahasiswa.alamat = alamatController.text;
                          // }

                          // kembali ke layar sebelumnya dengan membawa objek item
                          //Navigator.pop(context, mahasiswa);
                        },
                        backgroundColor: Colors.indigo,
                        icon: Icon(Icons.archive_outlined),
                        label: Text('Save',
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
                        label: Text('Cancel',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
              ],
            ),
          ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}