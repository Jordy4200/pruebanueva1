import 'package:flutter/material.dart';

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio N2"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 97, 94, 247),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Calculadora de Presión",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              altura(),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Resultado Final"),
                      content: calculoprecion(),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Continuar"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Iniciar Calculo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextEditingController _altura = TextEditingController();

Widget altura() {
  return TextField(
    keyboardType: TextInputType.number,
    controller: _altura,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      labelText: 'Ingrese altura',
      labelStyle: const TextStyle(fontSize: 18, color: Colors.white),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
    ),
    style: const TextStyle(color: Colors.white),
  );
}

Widget calculoprecion() {
  double densidad = 1025;
  double gravedad = 9.8;
  double altura = double.parse(_altura.text);
  double presion = densidad * gravedad * altura;
  return Text(
    "La presión es: ${presion.toStringAsFixed(2)}",
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  );
}
