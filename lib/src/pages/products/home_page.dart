import 'package:flutter/material.dart';
import 'package:proyectounderway/src/models/producto_model.dart';
import 'package:proyectounderway/src/providers/productos_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, 'producto')
                .then((value) => setState(() {})),
          )
        ],
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
              title: Text('Transportista'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, 'transportista');
              },
            ),
          ],
        ),
      ),
      body: _crearListado(),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
        future: productosProvider.cargarProductos(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
          if (snapshot.hasData) {
            final productos = snapshot.data;
            return ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, i) => _crearItem(context, productos[i]));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _crearItem(BuildContext context, ProductModel producto) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red),
        onDismissed: (direction) {
          productosProvider.borrarProducto(producto.id);
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Card(
              shadowColor: Color(0xFF282727),
              clipBehavior: Clip.antiAlias,
              borderOnForeground: true,
              child: Column(
                children: [
                  (producto.imagen_url == null)
                      ? Image(image: AssetImage('assets/no-image.png'))
                      : FadeInImage(
                          image: NetworkImage(producto.imagen_url),
                          placeholder: AssetImage('assets/jar-loading.gif'),
                          height: 200.0,
                          width: double.infinity,
                          fit: BoxFit.cover),
                  ListTile(
                    title:
                        Text('${producto.nombre_carga} - ${producto.tipo}'),
                    subtitle: Text('${producto.descripcion_carga}'),
                    onTap: () => Navigator.pushNamed(context, 'producto',
                            arguments: producto)
                        .then((value) => setState(() {})),
                  ),
                  ButtonBar(alignment: MainAxisAlignment.end, children: [
                    TextButton.icon(
                      onPressed: () {
                        _mostrarAlert(context);
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffFFB001)),
                      ),
                      label: Text('Ofertar'),
                      icon: Icon(Icons.monetization_on),
                    ),
                    TextButton.icon(
                      onPressed: () => Navigator.pushNamed(context, 'detalles')
                          .then((value) => setState(() {})),
                      //onPressed: () {Navigator.pushNamed(context, 'detalles');},
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffFFB001)),
                      ),
                      label: Text('Detalles'),
                      icon: Icon(Icons.book_online_outlined),
                    )
                  ]),
                ],
              )),
        ));
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('Oefertar'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Enviar Oferta'),
                TextFormField(
                  initialValue: '0',
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'Precio'),
                ),
                TextFormField(
                  initialValue: 'N.A',
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'Detalles del camion'),
                ),
                TextFormField(
                  initialValue: '0.0.0',
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(labelText: 'Tiempo de duracion'),
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancelar')),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Enviar')),
            ],
          );
        });
  }
}
