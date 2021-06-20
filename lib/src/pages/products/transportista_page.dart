import 'package:flutter/material.dart';

class Transportista extends StatefulWidget {
  @override
  _TransportistaState createState() => _TransportistaState();
}

class _TransportistaState extends State<Transportista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Transportista'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset('assets/fondolateral.jpg'),
                  ),
                  Text("UNDERWAY"),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Modo Usuario'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, 'home');
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.all(15),
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Column(
                      children: <Widget>[
                        Image(
                          height: 300,
                          width: 300,
                          image: NetworkImage('image/carga.png'),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Solicitud de carga en Lima',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.all(15),
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Column(
                      children: <Widget>[
                        Image(
                          height: 300,
                          width: 300,
                          image: NetworkImage('image/paquetes.png'),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text('Solicitud de carga en arequipa'),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.all(15),
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Column(
                      children: <Widget>[
                        Image(
                          height: 300,
                          width: 300,
                          image: NetworkImage('image/publicacion.png'),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text('Solicitud para carga en mollendo'),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.all(15),
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Column(
                      children: <Widget>[
                        Image(
                          height: 300,
                          width: 300,
                          image: NetworkImage('image/carga.png'),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text('Solicitud para Carga en Camana'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
