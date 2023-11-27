import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Buscar',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryButton(
                  imageUrl: categories[index]['imageUrl'] ?? '',
                  categoryName: categories[index]['name'] ?? '',
                  onPressed: () {
                    // Lógica de navegación
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  final VoidCallback onPressed;

  const CategoryButton({
    Key? key,
    required this.imageUrl,
    required this.categoryName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        color: Colors.white, // Cambiado a blanco
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              height: 160, // Ajustado a una altura más pequeña
              width: 160, // Ajustado a una anchura más pequeña
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8.0),
            Text(categoryName, style: const TextStyle(fontSize: 15.0)),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, String>> categories = [
  {'name': 'Frutas y Verduras', 'imageUrl': "assets/img/fyv.jpg"},
  {'name': 'Cremería', 'imageUrl': 'assets/img/cremeria.jpg'},
  {'name': 'Bebidas', 'imageUrl': 'assets/img/bebidas.jpg'},
  {'name': 'Carnes', 'imageUrl': 'assets/img/carnes.jpg'},
  {'name': 'Botanas', 'imageUrl': 'assets/img/botanas.jpg'},
  {'name': 'Mascotas', 'imageUrl': 'assets/img/mascotas.jpg'},
];
