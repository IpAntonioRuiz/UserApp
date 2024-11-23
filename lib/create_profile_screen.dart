import 'package:flutter/material.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();

  String? _validateFields() {
    if (_nameController.text.isEmpty) {
      return 'El nombre es obligatorio.';
    }
    if (_ageController.text.isEmpty) {
      return 'La edad es obligatoria.';
    }
    if (_occupationController.text.isEmpty) {
      return 'La ocupación es obligatoria.';
    }
    

    if (int.tryParse(_ageController.text) == null) {
      return 'Por favor ingrese una edad válida (solo números).';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Perfil'),
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
                  'Crear Perfil',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    labelText: 'Edad',
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _occupationController,
                  decoration: InputDecoration(
                    labelText: 'Ocupación',
                    labelStyle: const TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
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
                    String? errorMessage = _validateFields();
                    if (errorMessage != null) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: Text(errorMessage),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Aceptar'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Navigator.pushNamed(
                        context,
                        '/profile',
                        arguments: {
                          'name': _nameController.text,
                          'age': _ageController.text,
                          'occupation': _occupationController.text,
                        },
                      );
                    }
                  },
                  child: const Text('Guardar y Ver Perfil'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
