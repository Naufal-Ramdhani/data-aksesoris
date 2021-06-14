import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TambahData extends StatefulWidget {
  @override
  _TambahDataState createState() => new _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerKategori = TextEditingController();
  TextEditingController controllerHarga = TextEditingController();

  void tambah() {
    var url = "http://192.168.0.106/api_aksesoris/insert.php";

    http.post(Uri.parse(url), body: {
      "nama": controllerNama.text,
      "kategori": controllerKategori.text,
      "harga": controllerHarga.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: false,
        title: new Text("Tambah Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                
                new TextField(
                  controller: controllerNama,
                  decoration:
                      new InputDecoration(hintText: "Nama", labelText: "Nama"),
                ),
                new TextField(
                  controller: controllerKategori,
                  decoration: new InputDecoration(
                      hintText: "Kategori", labelText: "Kategori"),
                ),
                new TextField(
                  controller: controllerHarga,
                  decoration: new InputDecoration(
                      hintText: "Harga", labelText: "Harga"),
                ),
               
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Tambah Data"),
                  color: Colors.amber,
                  onPressed: () {
                    tambah();
                    Navigator.pushReplacementNamed(context, '/Home');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
