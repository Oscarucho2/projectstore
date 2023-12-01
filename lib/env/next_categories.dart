import 'package:flutter/material.dart';
import 'package:projectstore/services/firebase_service.dart';

class NextCategories extends StatelessWidget {
  final String categoryName;

  const NextCategories({Key? key, required this.categoryName}) : super(key: key);

  Future<List<Map<String, dynamic>>> loadProducts() async {
    // Llama al método para obtener los productos de la categoría actual
    
    return FirebaseService().getProductosPorCategoria(changeName(categoryName));
  }

  String changeName(String name)
  {
    String nameChange = '';
    switch (name){
      case 'Frutas y Verduras':
        nameChange = 'frutas_verduras';
      break;
        case 'Bebidas':
        nameChange = 'bebidas';
      break;
        case 'Botanas':
        nameChange = 'botanas';
      break;
        case 'Cremería':
        nameChange = 'cremeria';
      break;
        case 'Carnes':
        nameChange = 'carnes';
      break;
       case 'Mascotas':
        nameChange = 'mascotas';
      break;
    }
  

    return nameChange;
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
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay productos disponibles'));
          } else {
            // Aquí puedes construir tu interfaz de usuario con la lista de productos
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                // Construye un widget de tarjeta para cada producto
                return Card(
                  child: ListTile(
                    title: Text(product['nombre'] ?? ''),
                    subtitle: Text('Precio: \$${product['precio']}'),
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

