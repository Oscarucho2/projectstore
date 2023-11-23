import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    // Aquí puedes implementar la lógica de autenticación
    String username = usernameController.text;
    String password = passwordController.text;

    // Por ahora, simplemente imprime los valores ingresados
    print('Usuario: $username, Contraseña: $password');

    // Puedes agregar aquí la lógica de autenticación con una API, Firebase, etc.
  }

   final user = TextEditingController();
  final pass = TextEditingController();

  bool validateUser = true;
  bool validatePass = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff0B3F55),
      body: Center(
        child: Container(
          width: size.width * 0.6,
          padding: EdgeInsets.all(size.width * 0.01),
          decoration: BoxDecoration(
            color: Color(0xff07232F), // Color del fondo del contenedor externo
            borderRadius: BorderRadius.circular(20), // Bordes redondeados

          ),
          child: SingleChildScrollView(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Examen 2"),
                          content: Text("Suerte en el examen"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cerrar"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: Colors.white, // Cambiar el color del título
                    fontSize: 24, // Tamaño del título
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.5,
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Usuario:',
                    style: TextStyle(
                      color: Colors.white, // Cambiar el color del texto a blanco
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.5,
                  padding: const EdgeInsets.only(left: 30),
                  child: TextFormField(
                    controller: user,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                          color: Color.fromARGB(0, 0, 0, 0),
                        ),
                      ),
                      errorText: validateUser ? 'Debe escribir su usuario' : null,
                      filled: true,
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Usuario',
                    ),
                    onChanged: (dato) {
                      setState(() {
                        validateUser = dato.trim().isEmpty;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.5,
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Contraseña:',
                    style: TextStyle(
                      color: Colors.white, // Cambiar el color del texto a blanco
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.5,
                  padding: const EdgeInsets.only(left: 30),
                  child: TextFormField(
                    controller: pass,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0.00001,
                          style: BorderStyle.solid,
                          color: Color(0xffffffff),
                        ),
                      ),
                      hintText: 'Contraseña',
                      errorText: validatePass ? 'Debe escribir su contraseña' : null,
                      filled: true,
                      contentPadding: const EdgeInsets.all(10),
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 40,
                      ),
                    ),
                    onChanged: (dato) {
                      setState(() {
                        validatePass = dato.trim().isEmpty;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                 
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: Size(size.width * 0.3, 45),
                    primary: Color(0xffC6D300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 15),
                      Text(
                        'Ingresar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
