import 'package:bengalapp/services/auth_services.dart';
import 'package:bengalapp/widgets/dialog/show_snackbar.dart';
import 'package:bengalapp/widgets/text_input.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _repasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  AuthService authServices = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cadastro",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
          children: [
            const SizedBox(height: 200.0),
            _inputs(),
            const SizedBox(height: 20.0),
            _confirmButton(context),
          ],
        )),
      ),
    );
  }

  _inputs() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _name(),
          const SizedBox(height: 20.0),
          _email(),
          const SizedBox(height: 20.0),
          _password(),
          const SizedBox(height: 20.0),
          _rePassword(),
        ],
      ),
    );
  }

  _name() {
    return TextInput(
      off: false,
      password: false,
      name: true,
      controller: _nameController,
      text: 'Nome',
    );
  }

  _email() {
    return TextInput(
      off: false,
      password: false,
      email: true,
      controller: _emailController,
      text: 'E-mail',
    );
  }

  _password() {
    return TextInput(
      off: false,
      password: true,
      email: false,
      controller: _passwordController,
      text: 'Senha',
    );
  }

  _rePassword() {
    return TextInput(
      off: false,
      password: true,
      email: false,
      controller: _repasswordController,
      text: 'Confirmar Senha',
    );
  }

  _confirmButton(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
            height: 100,
            child: IconButton(
              iconSize: 50,
              onPressed: () {
                _registerButtonPressed(context);
              },
              icon: const Icon(Icons.chevron_right_outlined),
            )),
      ],
    );
  }

  _registerButtonPressed(context) {
    String email = _emailController.text;
    String password = _passwordController.text;
    String name = _nameController.text;
    print(email);
    print(password);

    if (_formKey.currentState!.validate() && _passwordCorrect()) {
      authServices
          .registerUser(name: name, email: email, password: password)
          .then((error) {
        if (error == null) {
          showSnackBar(
              context: context,
              mensagem: "Usuário cadastrado com sucesso!",
              isErro:
                  false); // Defina isErro como false para uma mensagem de sucesso.
          Navigator.pushNamed(context, '/NavPage');
        } else {
          showSnackBar(
              context: context,
              mensagem: "Erro ao criar a conta: $error",
              isErro: true); // Exibe o erro detalhado.
          print("Erro ao criar a conta: $error");
        }
      });
    } else {}
  }

  _passwordCorrect() {
    if (_passwordController.text == _repasswordController.text) {
      print("senha igual");
      return true;
    }
    print("erro senha");
    return false;
  }
}
