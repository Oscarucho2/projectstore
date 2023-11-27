import 'package:flutter/material.dart';
import 'package:projectstore/env/principal.dart';
import 'package:projectstore/register.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x0000),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              'Ingresa o Regístrate',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ingresa con tu correo registrado o número de teléfono',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
             const SizedBox(height: 18),
            Image.asset(
              "/img/login.jpg", // Ajusta la ruta de la imagen según tu proyecto
              width: 180,
              height: 180,
            ),
             Text(
              'Mi Tiendita',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Color gris de fondo
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person), // Ícono para el usuario
                        hintText: 'Usuario',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Color gris de fondo
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.lock), // Ícono para la contraseña
                        hintText: 'Contraseña',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navega a la pantalla de registro cuando se presiona el botón
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterView()),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: '¿No tienes cuenta? ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Regístrate',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navega a la pantalla de inicio de sesión cuando se presiona el botón
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PrincipalView()),
                );
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size.square(40)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Ajusta el radio de los bordes según lo necesario
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF5EC401)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.login,
                      color: Colors
                          .white), // Puedes cambiar el icono según tus necesidades
                  const SizedBox(width: 8), // Espacio entre el ícono y el texto
                  const Text('Iniciar Sesión',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
