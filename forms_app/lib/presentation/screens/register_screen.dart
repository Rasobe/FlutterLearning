import 'package:flutter/material.dart';
import 'package:forms_app/shared/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo usuario')),
      body: _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(children: [
              const FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              const SizedBox(
                height: 20,
              ),
            ]),
          )),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuario',
            onChanged: (p0) => username = p0,
            validator: (p0) {
              if (p0 == null || p0.isEmpty || p0.trim().isEmpty) {
                return 'Campo requerido';
              }
              if (p0.length < 6) {
                return 'Minimo 6 carácteres';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: (p0) => email = p0,
            validator: (p0) {
              if (p0 == null || p0.isEmpty || p0.trim().isEmpty) {
                return 'Campo requerido';
              }
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegExp.hasMatch(p0)) {
                return 'No tiene formato de correo';
              }

              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Contraseña',
            onChanged: (p0) => password = p0,
            obscureText: true,
            validator: (p0) {
              if (p0 == null || p0.isEmpty || p0.trim().isEmpty) {
                return 'Campo requerido';
              }
              if (p0.length < 6) {
                return 'Minimo 6 carácteres';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) {
                return;
              }
              print('$username, $email, $password');
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear usuario'),
          ),
        ],
      ),
    );
  }
}
