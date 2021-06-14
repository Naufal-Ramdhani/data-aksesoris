import 'package:flutter/material.dart';
import 'v_aksesoris.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data aksesoris',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Aksesoris(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new Aksesoris(),
      },
    );
  }
}
