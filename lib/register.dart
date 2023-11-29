import 'package:flutter/material.dart';
import 'package:projectstore/home.dart';
import 'package:projectstore/services/firebase_service.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Título
          const Text(
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
          const Text(
            'Mi Tiendita',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),

          // Inputs de registro
          buildInputWithIcon(
              Icons.email, 'Correo Electrónico', emailController),
          const SizedBox(height: 16),
          buildInputWithIcon(
              Icons.person, 'Nombre de Usuario', usernameController),
          const SizedBox(height: 16),
          buildInputWithIcon(Icons.lock, 'Contraseña', passwordController),

          const SizedBox(height: 16),

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
                child: const Text(
                  'Inicia Sesión',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Obtener los valores de los campos de texto
              String email = emailController.text;
              String username = usernameController.text;
              String password = passwordController.text;

              // Verificar que los campos no estén vacíos antes de enviar a la base de datos
              if (email.isNotEmpty &&
                  username.isNotEmpty &&
                  password.isNotEmpty) {
                // Llamar a la función para registrar al usuario en la base de datos
                FirebaseService().registerUser(email, username, password);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeView()),
                );
              } else {
                // Manejar el caso en que algún campo esté vacío
                // Puedes mostrar un mensaje de error o realizar otras acciones
              }
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size.square(40)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xFF5EC401)),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.login, color: Colors.white),
                SizedBox(width: 8),
                Text('Registrarme', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputWithIcon(
      IconData icon, String hintText, TextEditingController controller) {
    return Container(
      width: 300, // Ajusta el ancho del contenedor según sea necesario
      child: TextField(
        controller: controller,
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
