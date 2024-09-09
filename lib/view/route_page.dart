import 'package:flutter/material.dart';

class RoutePage extends StatelessWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "D.A.V.I",
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
            _browse(context),
            const SizedBox(height: 20.0),
            _routes(context),
          ],
        )),
      ),
    );
  }

  _browse(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/aaaa');
        },
        child: const Text(
          'Navegar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,

            // fontFamily: 'SourceSans'
          ),
        ),
      ),
    );
  }

  _routes(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/aaaa');
        },
        child: const Text(
          'Minhas Rotas',
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
