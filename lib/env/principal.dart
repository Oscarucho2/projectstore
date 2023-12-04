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
      backgroundColor: const Color(0xFFFFFFFF),
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
                MaterialPageRoute(builder: (context) => CarView()),
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
                        color: Colors.black), 
                  ),
                  const SizedBox(width: 8),
                  Text(
                    user,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
              accountEmail:
                  null, 
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.location_on), 
              title: const Text('Mis ubicaciones'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Mapa()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout), 
              title: const Text('Cerrar sesión'),
              onTap: () {
                      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
              },
            ),
  
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
                      30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Imagen centrada
              Center(
                child: Image.asset(
                  "assets/img/login.jpg",
                  width:
                      180, 
                  height:
                      180, 
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
                TextStyle(fontSize: 14), 
          ),
          const SizedBox(height: 16),

          // Botones
          buildMenuButton(context, 'Categorías'),
          const SizedBox(height: 10),
          buildMenuButton(context, 'Mis pedidos'),
        ],
      ),
    );
  }

  Widget buildMenuButton(BuildContext context, String buttonText) {
    return Container(
      width: 200, 
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
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CarView()),
              );
          }
        },
        child: Text(
          buttonText,
          style: const TextStyle(
              color: Colors.white), 
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color(
              0xFF5EC401), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
