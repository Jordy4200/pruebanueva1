import 'package:flutter/material.dart';

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio N1"),
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
                "Calculadora de Tiempos",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              velocidadInicial(),
              const SizedBox(height: 10),
              velocidadFinal(),
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
                      title: const Text("Resultado final"),
                      content: resultado(),
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

TextEditingController _vinicial = TextEditingController();
TextEditingController _vfinal = TextEditingController();

Widget velocidadInicial() {
  return TextField(
    keyboardType: TextInputType.number,
    controller: _vinicial,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      labelText: 'Ingrese velocidad inicial',
      labelStyle: const TextStyle(fontSize: 18, color: Colors.white),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
    ),
    style: const TextStyle(color: Colors.white),
  );
}

Widget velocidadFinal() {
  return TextField(
    keyboardType: TextInputType.number,
    controller: _vfinal,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      labelText: 'Ingrese velocidad final',
      labelStyle: const TextStyle(fontSize: 18, color: Colors.white),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
    ),
    style: const TextStyle(color: Colors.white),
  );
}

Widget resultado() {
  double vinicial = double.parse(_vinicial.text);
  double vfinal = double.parse(_vfinal.text);
  double a = 10;

  double tiempo = (vfinal - vinicial) / a;

  if (tiempo <= 10) {
    return Text(
        "El vehículo aprobó con un tiempo de: ${tiempo.toStringAsFixed(2)} segundos.");
  } else {
    return Text(
        "El vehículo no aprobó con un tiempo de: ${tiempo.toStringAsFixed(2)} segundos.");
  }
}
