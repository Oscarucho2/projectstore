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

              return Card(
                child: ListTile(
                  title: Text(cartItem['product'] ?? ''),
                  subtitle: Text('Precio: \$${cartItem['price']}'),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      conection.removeItemFromCart(cartItem['product'] ?? '');
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
