import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Halaman About",
    home: new About(),
  ));
}

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Halaman Dashboard"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Center(
          child: new Text("Halaman satu"),
        ),
      ),
    );
  }
}
