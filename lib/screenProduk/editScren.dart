import 'package:crud/form/editProduk.dart';
import 'package:flutter/material.dart';


class EditProdukScreen extends StatefulWidget {
  final String currentNamaProduk;
  final String currentCode;
  final String currentKategori;
  final String currentDeskripsi;
  final int currentHarga;
  final int currentStok;
  final String currentImageUrl;
  final String documentId;

  EditProdukScreen ({
  this.currentNamaProduk,
  this.currentCode,
  this.currentKategori,
  this.currentDeskripsi,
  this.currentHarga,
  this.currentStok,
  this.currentImageUrl,
  this.documentId,
  });

  @override
  _EditProdukScreenState createState() => _EditProdukScreenState();
}

class _EditProdukScreenState extends State<EditProdukScreen> {
  final FocusNode _namaProdukFocusNode = FocusNode();
  final FocusNode _codeFocusNode = FocusNode();
  final FocusNode _kategoriFocusNode = FocusNode();
  final FocusNode _deskripsiFocusNode = FocusNode();
  final FocusNode _hargaFocusNode = FocusNode();
  final FocusNode _stokFocusNode = FocusNode();
  final FocusNode _imageUrlFocusNode = FocusNode();

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
         _imageUrlFocusNode.unfocus();
        
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.indigo,
          title: Text("Edit Produk"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 20.0,
            ),
            child: EditProdukForm(
              documentId: widget.documentId,
              focusNamaProduk: _namaProdukFocusNode,
              focusCode: _codeFocusNode,
              focusKategori:_kategoriFocusNode,
              focusDeskripsi: _deskripsiFocusNode,
              focusHarga: _hargaFocusNode,
              focusStok:  _stokFocusNode,
              focusImageUrl: _imageUrlFocusNode,
              currentNamaProduk: widget.currentNamaProduk,
              currentCode: widget.currentCode,
              currentKategori: widget.currentKategori,
              currentDeskripsi: widget.currentDeskripsi,
              currentHarga: widget.currentHarga,
              currentStok: widget.currentStok,
              currentImageUrl: widget.currentImageUrl,
          
            ),
          ),
        ),
      ),
    );
  }
}