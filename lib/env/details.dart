import 'package:flutter/material.dart';

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

            // Botón "Agregar a la cesta"
            ElevatedButton.icon(
              onPressed: () {
                // Agrega la lógica para añadir a la cesta
                // Puedes utilizar un método o función para manejar esto
              },
              icon: const Icon(Icons.shopping_cart, color: Colors.white,),
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
}
