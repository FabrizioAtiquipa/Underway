import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:proyectounderway/src/pages/Map/map_page.dart';
import 'package:proyectounderway/src/pages/products/home_page.dart';
import 'package:proyectounderway/src/pages/products/transportista_page.dart';
import 'package:proyectounderway/src/providers/productos_provider.dart';

class PincipalTransportista extends StatefulWidget {
  @override
  _PincipalTransportistaState createState() => _PincipalTransportistaState();
}

class _PincipalTransportistaState extends State<PincipalTransportista> {
  final productosProvider = new ProductosProvider();
  int _page = 0;
  final MapScreen _map = MapScreen();
  final Transportista _home = Transportista();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _showPage,
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        color: Color(0xffFFB001),
        buttonBackgroundColor: Color(0xffFFB001),
        backgroundColor: Colors.transparent,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.list, size: 30, color: Colors.white),
          Icon(Icons.map, size: 30, color: Colors.white),
        ],
        onTap: (int index) {
          setState(() {
            _showPage = _pageChooser(index);
          });
        },
      ),
    );
  }

  Widget _showPage = Transportista();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _home;
        break;
      case 1:
        return _map;
        break;
    }
  }
}
