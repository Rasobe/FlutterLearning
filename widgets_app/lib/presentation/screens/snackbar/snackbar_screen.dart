import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  const SnackbarScreen({super.key});

  static const name = 'snackbar_screen';

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
            'Do aliquip pariatur ex officia pariatur culpa sint et ea in aliquip anim laborum minim. Reprehenderit ullamco qui non tempor. Nisi pariatur consectetur nostrud anim tempor aute ea aliqua duis pariatur pariatur voluptate laborum ipsum. Et in aliqua non voluptate id nostrud. Reprehenderit excepteur eiusmod sunt dolor amet dolor voluptate culpa ex quis. Pariatur incididunt do fugiat tempor sint irure occaecat cillum esse. Aute laboris enim eiusmod minim eu adipisicing ea enim enim amet cillum commodo ea.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y diálogos')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
              onPressed: () => showAboutDialog(context: context, children: [
                    const Text(
                        'Eu do Lorem sint commodo sit ullamco. Est id amet occaecat sit Lorem ad excepteur pariatur nostrud fugiat. Officia esse cupidatat incididunt occaecat commodo eu velit. Eiusmod incididunt amet minim laborum. Labore ea eu enim do commodo proident. Velit nulla tempor labore commodo non.')
                  ]),
              child: const Text('Licencias usadas')),
          FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo'))
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
