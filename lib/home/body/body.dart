// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_element

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// La clase base para los diferentes tipos de elementos que la Lista puede contener
abstract class ListItem {}

// Un ListItem que contiene datos para mostrar un encabezado
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

// Un ListItem que contiene datos para mostrar un mensaje
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

class Presentaciones {
  final String titulo;
  final double precio;
  Presentaciones(this.titulo, this.precio);
}

class Producto {
  final String titulo;
  final List<Object> precentaciones;
  final String descripcion;
  final double precio;
  final String img;

  Producto(this.titulo, this.precentaciones, this.descripcion, this.precio,
      this.img);
}

// import 'package:flutter';
class BodyMenu extends StatefulWidget {
  const BodyMenu({Key? key}) : super(key: key);

  @override
  _BodyMenuState createState() => _BodyMenuState();
}

class _BodyMenuState extends State<BodyMenu> {
  final List<Producto> items = [
    Producto(
        'Pollo frito',
        [
          {'titulo': 'Media oredn 300gr', 'precio': 300},
          {'titulo': 'Orden 500gr', 'precio': 300}
        ],
        'El pollo frito incluye una guarnición de papas fritas y ensalada de jitomate',
        500,
        'https://recetacubana.com/wp-content/uploads/2019/10/como-hacer-pollo-frito.jpg'),
    Producto(
        'Costilla',
        [
          {'titulo': 'Media oredn 300gr', 'precio': 300},
          {'titulo': 'Media oredn 300gr', 'precio': 300}
        ],
        'Este corte es un pedazo de lomo con hueso. Se usa con huesos ya que esto permite que al cocinarse su sabor sea más intenso y delicioso.',
        500,
        'https://cdn2.cocinadelirante.com/sites/default/files/images/2017/07/cortesdecarne.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _tarjeta(item);
      },
    );
  }

  Widget _categoria() {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      color: Colors.red,
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: [
                  // ignore: prefer_const_literals_to_create_immutables
                  Column(children: [
                    Icon(
                      Icons.flatware,
                      color: Colors.white,
                    )
                  ]),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(' Carnes',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ))),
    );
  }

  Widget _tarjeta(producto) {
    // ignore: unused_local_variable
    final dato = producto.precentaciones.length;

    return Card(
      margin: EdgeInsets.all(20),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            Image(image: NetworkImage(producto.img)),
            Align(
              alignment: Alignment(0.9, 1.0),
              heightFactor: 0.5,
              child: FloatingActionButton(
                onPressed: null,
                child: Icon(Icons.add_shopping_cart),
                backgroundColor: Colors.red,
              ),
            ),
            ListTile(
              title: Text(
                producto.titulo,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Row(
                children: [
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('Precentacion y precio:'),
                    ],
                  ),
                  Column(children: [
                    PopupMenuButton<WhyFarther>(
                      onSelected: (WhyFarther result) {
                        setState(() {});
                      },
                      itemBuilder: (BuildContext context) => producto
                          .precentaciones
                          .map<PopupMenuEntry<WhyFarther>>(
                              (data) => PopupMenuItem<WhyFarther>(
                                    value: WhyFarther.harder,
                                    child: Text(
                                        '${data["titulo"]} - \$${data["precio"]}'),
                                  ))
                          .toList(),
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                  'El pollo frito incluye una guarnición de papas fritas y ensalada de jitomate'),
            )
          ],
        ),
      ),
    );
  }
}
