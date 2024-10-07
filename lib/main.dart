import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Navegación con Navigator',
    home: MainScreen(),
  ));
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pantalla Principal"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              final scaffoldMessenger = ScaffoldMessenger.of(context);

              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => const SecondScreen(
                    buttonCount: 6,
                  ),
                ),
              );

              if (result != null) {
                scaffoldMessenger.showSnackBar(
                  SnackBar(content: Text("Elegiste el boton $result")),
                );
              }
            },
            child: const Text("Ir a la Segunda Pantalla")),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final int buttonCount;

  const SecondScreen({Key? key, required this.buttonCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda Pantalla"),
      ),
      body: ListView(
        children: List.generate(buttonCount, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                foregroundColor: MaterialStateProperty.all(Colors.blueAccent),
              ),
              child: Text("Boton ${index + 1}"),
              onPressed: () {
                Navigator.of(context).pop(index + 1);
              },
            ),
          );
        }),
      ),
    );
  }
}
