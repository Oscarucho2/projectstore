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
              height: 400, // Ajusta la altura según sea necesario
              width: double.infinity, // O ajusta el ancho según tus necesidades
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
      // Obtén una referencia a la colección 'car'
      final CollectionReference cartCollection =
          FirebaseFirestore.instance.collection('car');

      // Obtiene el ID del usuario actual (puedes cambiar esto según tu autenticación)
      final String userId =
          'user123'; // Aquí debes colocar la lógica para obtener el ID del usuario actual

      // Añade la información a la colección 'car'
      await cartCollection.add({
        'userId': userId,
        'product': productDetails['nombre'],
        'price': productDetails['precio'],
        // Agrega otros campos según sea necesario
      });

      // Muestra un mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Producto añadido a la cesta')),
      );
    } catch (e) {
      // Manejo de errores
      print('Error al añadir a la cesta: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al añadir a la cesta')),
      );
    }
  }
}
