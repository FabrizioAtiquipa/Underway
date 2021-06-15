import 'package:flutter/material.dart';

class Transportista extends StatefulWidget {
  @override
  _TransportistaState createState() => _TransportistaState();
}

class _TransportistaState extends State<Transportista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transportista'),
      ),
    );
  }
}
