import 'package:flutter/material.dart';
import 'package:projectstore/home.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x0000),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Título
          Text(
            'Regístrate',
            style: TextStyle(
              fontSize: 24, // Ajusta el tamaño del título según sea necesario
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Imagen centrada
          Center(
            child: Image.asset(
              "/img/login.jpg", // Ruta de tu imagen de registro
              width: 180, // Ajusta el ancho de la imagen según sea necesario
              height: 180, // Ajusta la altura de la imagen según sea necesario
            ),
            
          ),
                 Text(
              'Mi Tiendita',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 32),

          // Inputs de registro
          buildInputWithIcon(Icons.email, 'Correo Electrónico'),
          const SizedBox(height: 16),
          buildInputWithIcon(Icons.person, 'Nombre de Usuario'),
          const SizedBox(height: 16),
          buildInputWithIcon(Icons.lock, 'Contraseña'),

          const SizedBox(height: 16),

          // Texto "¿Ya tienes cuenta?"
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("¿Ya tienes cuenta? "),
              InkWell(
                onTap: () {
                  // Navega a la pantalla de inicio de sesión cuando se presiona el enlace
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeView()),
                  );
                },
                child: Text(
                  'Inicia Sesión',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),
           const SizedBox(height: 16),
             ElevatedButton(
              onPressed: () {
                // Navega a la pantalla de inicio de sesión cuando se presiona el botón
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
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
                  const Text('Registrarme',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget buildInputWithIcon(IconData icon, String hintText) {
    return Container(
      width: 300, // Ajusta el ancho del contenedor según sea necesario
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
