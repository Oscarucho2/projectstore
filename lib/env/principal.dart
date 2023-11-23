import 'package:flutter/material.dart';


class PrincipalView extends StatelessWidget {
  
  const PrincipalView({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B3F55),
      appBar: AppBar(
        title: const Text('Bienvenido'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          // Botón de carrito de compras en la esquina superior derecha
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Implementa la lógica para el botón de carrito de compras
              // Puedes abrir una nueva ventana para mostrar el carrito, por ejemplo.
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('¡Hola usuario!'), // Coloca la lógica para obtener el nombre de usuario de la base de datos
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Menú Principal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Opción 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Opción 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
