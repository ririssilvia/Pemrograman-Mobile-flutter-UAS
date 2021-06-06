import 'package:crud/form/editKategori.dart';
import 'package:flutter/material.dart';

class EditKategoriScreen extends StatefulWidget {
  final String currentNamaKategori;
  final String currentDeskripsi;
  final String documentId;

  EditKategoriScreen({
     this.currentNamaKategori,
    this.currentDeskripsi,
    this.documentId,
  });

  @override
  _EditKategoriState createState() => _EditKategoriState();
}

class _EditKategoriState extends State<EditKategoriScreen> {
  final FocusNode _namaKategoriFocusNode = FocusNode();
  final FocusNode _deskripsiFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _namaKategoriFocusNode.unfocus();
        _deskripsiFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text("Kategori"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditKategoriForm(
              documentId: widget.documentId,
              focusNamaKategori: _namaKategoriFocusNode,
              focusDeskripsi: _deskripsiFocusNode,
              currentNamaKategori: widget.currentNamaKategori,
              currentDeskripsi: widget.currentDeskripsi,
            ),
          ),
        ),
      ),
    );
  }
}