import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarView extends StatelessWidget {
  const CarView({Key? key}) : super(key: key);

  Future<List<Map<String, dynamic>>> getShoppingCartItems() async {
    try {
      QuerySnapshot cartSnapshot =
          await FirebaseFirestore.instance.collection('car').get();

      List<Map<String, dynamic>> cartItems = cartSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      return cartItems;
    } catch (error) {
      print("Error al obtener la cesta: $error");
      return [];
    }
  }

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
        future: getShoppingCartItems(),
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
