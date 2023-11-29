import 'package:flutter/material.dart';
import 'package:projectstore/home.dart';
import 'package:projectstore/env/categories.dart';
import 'package:projectstore/env/car.dart';
import 'package:projectstore/env/map.dart';

class PrincipalView extends StatelessWidget {
  final String user;

  const PrincipalView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00000000),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CarView()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        // Contenido del menú lateral
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Row(
                children: [
                  const CircleAvatar(
                    child: Icon(Icons.account_circle,
                        color: Colors.black), // Ícono de usuario
                  ),
                  const SizedBox(width: 8), // Espacio entre el ícono y el texto
                  Text(
                    user,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
              accountEmail:
                  null, // Puedes agregar el correo aquí si es necesario
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.edit), // Ícono de editar perfil
              title: const Text('Editar perfil'),
              onTap: () {
                // Agrega la lógica para la opción 'Editar perfil'
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on), // Ícono de ubicaciones
              title: const Text('Mis ubicaciones'),
              onTap: () {
                // Agrega la lógica para la opción 'Mis ubicaciones'
                Navigator.pop(context); // Cierra el Drawer

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Mapa()), // Reemplaza MapView con el nombre de tu pantalla de mapa
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart), // Ícono de carrito
              title: const Text('Mis pedidos'),
              onTap: () {
                // Agrega la lógica para la opción 'Mis pedidos'
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout), // Ícono de cerrar sesión
              title: const Text('Cerrar sesión'),
              onTap: () {
                // Agrega la lógica para la opción 'Cerrar sesión'
                Navigator.pop(context); // Cierra el Drawer
              },
            ),
            // Agrega otras opciones del menú según sea necesario
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Título e Imagen centrada
          Column(
            children: [
              const Text(
                'Bienvenid@',
                style: TextStyle(
                  fontSize:
                      30, // Ajusta el tamaño del título según sea necesario
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Imagen centrada
              Center(
                child: Image.asset(
                  "/img/login.jpg", // Ruta de tu imagen de bienvenida
                  width:
                      180, // Ajusta el ancho de la imagen según sea necesario
                  height:
                      180, // Ajusta la altura de la imagen según sea necesario
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Texto "Menú"
          const Text(
            'Menú',
            style: TextStyle(
              fontSize: 20, // Ajusta el tamaño según sea necesario
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          // Subtexto
          const Text(
            'Selecciona la opción que desees:',
            style:
                TextStyle(fontSize: 14), // Ajusta el tamaño según sea necesario
          ),
          const SizedBox(height: 16),

          // Botones
          buildMenuButton(context, 'Categorías'),
          const SizedBox(height: 10),
          buildMenuButton(context, 'Compras'),
          const SizedBox(height: 10),
          buildMenuButton(context, 'Mis pedidos'),
        ],
      ),
    );
  }

  Widget buildMenuButton(BuildContext context, String buttonText) {
    return Container(
      width: 200, // Ajusta el ancho del botón según sea necesario
      child: ElevatedButton(
        onPressed: () {
          if (buttonText == 'Salir') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          }
          if (buttonText == 'Categorías') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoriesView()),
            );
          } else {
            // Agrega la lógica para otras opciones del menú
          }
        },
        child: Text(
          buttonText,
          style: const TextStyle(
              color: Colors.white), // Cambia el color del texto a blanco
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color(
              0xFF5EC401), // Cambia el color de fondo según sea necesario
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
