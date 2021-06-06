import 'package:crud/form/addProduk.dart';
import 'package:flutter/material.dart';


class AddProdukScreen extends StatelessWidget {
  final FocusNode _namaProdukFocusNode = FocusNode();
  final FocusNode _codeFocusNode = FocusNode();
  final FocusNode _kategoriFocusNode = FocusNode();
  final FocusNode _deskripsiFocusNode = FocusNode();
  final FocusNode _hargaFocusNode = FocusNode();
  final FocusNode _stokFocusNode = FocusNode();
  final FocusNode _imageUrlNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _namaProdukFocusNode.unfocus();
        _codeFocusNode.unfocus();
        _kategoriFocusNode.unfocus();
        _deskripsiFocusNode.unfocus();
        _hargaFocusNode.unfocus();
        _stokFocusNode.unfocus();
        _imageUrlNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.indigo,
          title: Text("Tambah Prdouk"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: AddProdukForm(
              focusNamaProduk: _namaProdukFocusNode ,
              focusCode: _codeFocusNode,
              focusKategori: _kategoriFocusNode,
              focusDeskripsi: _deskripsiFocusNode,
              focusHarga: _hargaFocusNode,
              focusStok : _stokFocusNode,
              focusImageUrl: _imageUrlNode,
            ),
          ),
        ),
      ),
    );
  }
}