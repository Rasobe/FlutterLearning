import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando películas',
      'Comprando paloimtas de maíz',
      'Cargando populares',
      'Llamando a mi ex',
      'Que asco esperar...',
      'Esto está tardando más de lo esperado...',
    ];
    return Stream.periodic(
      const Duration(milliseconds: 2400),
      (step) => messages[step],
    ).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Espere por favor'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: getLoadingMessages(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) return const Text('Cargando...');
              return Text(snapshot.data);
            },
          ),
        ],
      ),
    );
  }
}
