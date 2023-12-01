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
            Text('Nombre: ${productDetails['nombre']}'),
            const SizedBox(height: 8),
            Text('Precio: \$${productDetails['precio']}'),
            // Agrega más detalles según la estructura de tus datos
            // Puedes mostrar la descripción, el ID, u otros detalles del producto

            const SizedBox(height: 16),

            // Agrega aquí cualquier otra información que desees mostrar

            // Puedes personalizar y agregar más widgets según tus necesidades
          ],
        ),
      ),
    );
  }
}
