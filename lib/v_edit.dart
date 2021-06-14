import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerNama;
  TextEditingController controllerKategori;
  TextEditingController controllerHarga;

  void editData() {
    var url = "http://192.168.0.106/api_aksesoris/edit.php";

    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      "nama": controllerNama.text,
      "kategori": controllerKategori.text,
      "harga": controllerHarga.text,
    });
  }

  @override
  void initState() {
  
    controllerNama =
        new TextEditingController(text: widget.list[widget.index]['nama']);
    controllerKategori = new TextEditingController(
        text: widget.list[widget.index]['kategori']);
    controllerHarga =
        new TextEditingController(text: widget.list[widget.index]['harga']);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber,

        title: new Text("EDIT DATA"),
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
                  child: new Text("Edit"),
                  color: Colors.amber,
                  onPressed: () {
                    editData();
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
