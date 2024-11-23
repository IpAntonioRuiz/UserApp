import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String name = args['name'] ?? '';
    final String age = args['age'] ?? '';
    final String occupation = args['occupation'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: const Color.fromARGB(255, 38, 38, 38),
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Container(
        color: const Color.fromARGB(255, 51, 51, 51),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(50),
            width: MediaQuery.of(context).size.width * 0.50,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Perfil del Usuario',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Nombre: $name',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Edad: $age',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Ocupación: $occupation',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context, 
                      '/',
                      (route) => false,
                    );
                  },
                  child: const Text('Regresar a Inicio'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}