import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:proyectounderway/src/pages/oferta/card_screen.dart';
import 'package:proyectounderway/src/pages/products/home_page.dart';
import 'package:proyectounderway/src/providers/productos_provider.dart';

class PincipalPage extends StatefulWidget {
  @override
  _PincipalPageState createState() => _PincipalPageState();
}

class _PincipalPageState extends State<PincipalPage> {
  final productosProvider = new ProductosProvider();
  int _page = 0;
  final HomePage _home = HomePage();
  final CardPage _card = CardPage();

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
          Icon(Icons.monetization_on, size: 30, color: Colors.white),
        ],
        onTap: (int index) {
          setState(() {
            _showPage = _pageChooser(index);
          });
        },
      ),
    );
  }

  Widget _showPage = HomePage();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _home;
        break;
      case 1:
        return _card;
        break;
    }
  }
}
