
import 'package:crud/form/addKategori.dart';
import 'package:flutter/material.dart';


class AddScreenKategori extends StatelessWidget {
  final FocusNode _namaKategoriFocusNode = FocusNode();
  final FocusNode _deskripsiFocusNode = FocusNode();

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
          backgroundColor: Colors.indigoAccent,
          title: Text("Tambah Kategori"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddKategoriForm(
              focusNamaKategori: _namaKategoriFocusNode,
              focusDeskripsi: _deskripsiFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}