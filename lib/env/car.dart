import 'package:flutter/material.dart';

class CarView extends StatelessWidget {
  const CarView({Key? key}) : super(key: key);

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
      body: const Center(
        child: const Text(
          'Contenido de la vista de compras',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
