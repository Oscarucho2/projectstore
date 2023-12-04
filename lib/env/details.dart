import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsView extends StatelessWidget {
  final Map<String, dynamic> productDetails;

  const DetailsView({Key? key, required this.productDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto
            Image.network(
              productDetails['imagen'] ?? '',
              height: 330,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            // Nombre del producto
            Text(
              productDetails['nombre'] ?? '',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Precio del producto
            Text(
              'Precio: \$${productDetails['precio']}',
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF5EC401),
              ),
            ),
            const SizedBox(height: 16),

            // Descripción del producto
            Text(
              '${productDetails['descripcion']}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            ElevatedButton.icon(
              onPressed: () async {
                // Añadir a la cesta
                await addToCart(productDetails, context);
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              label: const Text(
                'Añadir a la cesta',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF5EC401),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addToCart(
      Map<String, dynamic> productDetails, BuildContext context) async {
    try {
      final CollectionReference cartCollection =
          FirebaseFirestore.instance.collection('car');
      await cartCollection.add({
        'product': productDetails['nombre'],
        'price': productDetails['precio'],
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Producto añadido a la cesta')),
      );
    } catch (e) {
      print('Error al añadir a la cesta: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al añadir a la cesta')),
      );
    }
  }
}
