import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('ListKategori');

class DatabaseKatgeori {
  static String userUid;

  static Future<void> addKategori({
     String namaKategori,
     String deskripsi,
  }) async {
    //
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('kategori').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "namaKategori": namaKategori,
      "deskripsi": deskripsi,
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note kategori added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateKategori({
    String namaKategori,
    String deskripsi,
    String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('kategori').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "namaKategori": namaKategori,
      "deskripsi": deskripsi,
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note Kategori updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readKategori() {
    CollectionReference notesItemCollection =
        _mainCollection.doc(userUid).collection('kategori');

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteKategori({
   String docId,
  }) async {
    DocumentReference documentReferencer =
        _mainCollection.doc(userUid).collection('kategori').doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note kategori deleted from the database'))
        .catchError((e) => print(e));
  }
}
