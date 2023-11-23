import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool validateUser = false;
  bool validatePass = false;

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
            color: Color(0xff07232F),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Registro',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.5,
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    'Nombre de usuario',
                    style: TextStyle(
                      color: Colors.white,
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
                      color: Colors.white,
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
                    // Implementa la lógica de registro aquí
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
                        'Registrarse',
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
