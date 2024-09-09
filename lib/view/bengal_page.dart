import 'package:bengalapp/widgets/sound_button.dart';
import 'package:flutter/material.dart';

class BengalPage extends StatelessWidget {
  const BengalPage({super.key});

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
            const SizedBox(height: 50.0),
            _subtitle(),
            const SizedBox(height: 50.0),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [_browse(context), _sound()],
            ),
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
          "Conecte um Davi",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _browse(context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/aaaa');
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Davi do Bernar",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 60),
            Text(
              "Conectar",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sound() {
    return SoundButton();
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
