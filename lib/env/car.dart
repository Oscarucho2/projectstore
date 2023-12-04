import 'package:flutter/material.dart';
import 'package:projectstore/services/firebase_service.dart';

class CarView extends StatelessWidget {
  CarView({Key? key}) : super(key: key);

  final FirebaseService conection = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compras'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: conection.getShoppingCartItems(),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('La cesta está vacía'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final cartItem = snapshot.data![index];

                // Obtén el id del pedido y el precio
                final String orderId = cartItem['id'] ?? '';
                final String price = cartItem['price'] ?? '';

                return Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.shopping_bag,
                      color: const Color(0xFF5EC401),
                    ),
                    title: Text('Pedido #$orderId'),
                    subtitle: Text('Precio: \$${price}',
                        style: TextStyle(color: Colors.orange)),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () async {
                        bool removed = await conection
                            .removeItemFromCart(cartItem['product'] ?? '');
                        if (removed) {
                          // Se eliminó correctamente
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Producto eliminado')),
                          );
                        } else {
                          // No se pudo eliminar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('No se pudo eliminar el producto')),
                          );
                        }
                      },
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
