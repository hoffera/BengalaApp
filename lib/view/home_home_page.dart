import 'package:bengalapp/view/login_page.dart';
import 'package:flutter/material.dart';

class HomeHomePage extends StatelessWidget {
  const HomeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
          children: [
            const SizedBox(height: 200.0),
            _subtitle(),
            const SizedBox(height: 200.0),
            _register(context),
            const SizedBox(height: 20.0),
            _login(context),
          ],
        )),
      ),
    );
  }

  _subtitle() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Já tem conta?",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _register(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/registerPage');
        },
        child: const Text(
          'Não, preciso me cadastrar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,

            // fontFamily: 'SourceSans'
          ),
        ),
      ),
    );
  }

  _login(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        child: const Text(
          'Já tenho conta!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,

            // fontFamily: 'SourceSans'
          ),
        ),
      ),
    );
  }
}
