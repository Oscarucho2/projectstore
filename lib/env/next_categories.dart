import 'package:flutter/material.dart';
import 'package:projectstore/services/firebase_service.dart';
import 'package:projectstore/env/details.dart';

class NextCategories extends StatelessWidget {
  final String categoryName;

  const NextCategories({Key? key, required this.categoryName})
      : super(key: key);

  Future<List<Map<String, dynamic>>> loadProducts() async {

    return FirebaseService().getProductosPorCategoria(changeName(categoryName));
  }

  String changeName(String name) {
    String nameChange = '';
    switch (name) {
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
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailsView(productDetails: product),
                    ),
                  );
                },
                child: Card(
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          product['imagen'] ?? '',
                          height: 100,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product['nombre'] ?? '',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text('Precio: \$${product['precio']}'),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
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
