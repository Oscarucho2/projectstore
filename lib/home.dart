import 'package:flutter/material.dart';
import 'package:projectstore/login.dart'; // Importa la pantalla de inicio de sesión
import 'package:projectstore/register.dart'; // Importa la pantalla de registro


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0B3F55),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Puedes reemplazar el logo con tu propia imagen
          Image.asset(
            'assets/logo.png', // Ajusta la ruta de la imagen según tu proyecto
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              // Navega a la pantalla de inicio de sesión cuando se presiona el botón
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              );
            },
            child: const Text('Iniciar Sesión'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Navega a la pantalla de registro cuando se presiona el botón
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterView()),
              );
            },
            child: const Text('Registrarse'),
          ),
        ],
      ),
    );
  }
}
