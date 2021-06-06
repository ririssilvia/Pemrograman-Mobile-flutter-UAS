import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('ListProduk');

class DatabaseProduk {
  static String userUid;

  static Future<void> addProduk({
     String namaProduk,
     String code,
     String kategori,
     String deskripsi,
     int harga,
     int stok,
     String imageUrl,
     
  }) async {
    //
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('produk').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "namaproduk": namaProduk,
      "code" : code,
      "kategori" : kategori,
      "deskripsi": deskripsi,
      "harga" : harga,
      "stok" : stok,
      "imageUrl" : imageUrl,

    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note produk added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateProduk({
    String namaProduk,
    String code,
    String kategori,
    String deskripsi,
    int harga,
    int stok,
    String imageUrl,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('produk').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "namaproduk": namaProduk,
      "code" : code,
      "kategori" : kategori,
      "deskripsi": deskripsi,
      "harga" : harga,
      "stok" : stok,
      "imageUrl" : imageUrl,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note Produk updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readProduk() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('produk');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteProduk({
   String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('produk').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note produk deleted from the database'))
        .catchError((e) => print(e));
  }
}
