import 'package:flutter/material.dart';

class NextCategories extends StatelessWidget {
  final String categoryName;

  NextCategories({required this.categoryName});

  // Función para cargar productos de la categoría desde la base de datos
  Future<List<Map<String, dynamic>>> loadProducts() async {
    // Aquí debes implementar la lógica para cargar productos desde la base de datos
    // Puedes usar Firebase, SQLite u otro sistema de base de datos según tu aplicación
    // Retorna una lista de productos, donde cada producto es un mapa de datos
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: FutureBuilder(
        future: loadProducts(),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay productos disponibles'));
          } else {
            // Aquí puedes construir tu interfaz de usuario con la lista de productos
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                // Construye un widget de tarjeta para cada producto
                return Card(
                  child: ListTile(
                    title: Text(product['productName'] ?? ''),
                    subtitle: Text('Precio: \$${product['price']}'),
                    // Otros detalles del producto
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
