import 'package:bengalapp/services/auth_services.dart';
import 'package:bengalapp/widgets/alert/loading_alert.dart';
import 'package:bengalapp/widgets/dialog/show_snackbar.dart';
import 'package:bengalapp/widgets/text_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthService authServices = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login",
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
            const SizedBox(height: 10.0),
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
          _emailInput(),
          const SizedBox(height: 20.0),
          _passwordInput(),
        ],
      ),
    );
  }

  _emailInput() {
    return TextInput(
      off: false,
      password: false,
      text: 'Seu e-mail',
      controller: _emailController,
    );
  }

  _passwordInput() {
    return TextInput(
      off: false,
      password: true,
      text: 'Sua senha',
      controller: _passwordController,
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
                _loginButtonPressed(context);
              },
              icon: const Icon(Icons.chevron_right_outlined),
            )),
      ],
    );
  }

  _loginButtonPressed(context) {
    String email = _emailController.text;
    String senha = _passwordController.text;

    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible:
            false, // Impedir que o diálogo seja fechado ao tocar fora dele
        builder: (BuildContext context) {
          return const LoadingAlert();
        },
      );
      authServices.loginUser(email: email, password: senha).then((error) {
        Navigator.pop(context);
        if (error == null) {
          showSnackBar(
              context: context, mensagem: "Logado com sucesso!", isErro: false);
          Navigator.pushNamed(context, '/NavPage');
        } else {
          showSnackBar(context: context, mensagem: error, isErro: true);
        }
      });
    }
  }
}
