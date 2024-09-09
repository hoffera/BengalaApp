import 'package:bengalapp/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100.0),
              _subtitle(),
              const SizedBox(height: 50.0),
              _themeWhiteBlack(context),
              const SizedBox(height: 30.0),
              _themeBlackWhite(context),
              const SizedBox(height: 30.0),
              _themeYellowBlack(context),
              const SizedBox(height: 30.0),
              _tritanopiaThemeButton(context),
              const SizedBox(height: 50.0),
              _confirmButton(context),
            ],
          ),
        ),
      ),
    );
  }

  _subtitle() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Escolha a cor que deseja:",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _themeWhiteBlack(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme(1);
        },
        child: const Text(
          'Fundo preto/ letras brancas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,

            // fontFamily: 'SourceSans'
          ),
        ),
      ),
    );
  }

  _themeBlackWhite(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme(2);
        },
        child: const Text(
          'Fundo branco/ letras pretas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,

            // fontFamily: 'SourceSans'
          ),
        ),
      ),
    );
  }

  _themeYellowBlack(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme(3);
        },
        child: const Text(
          'Fundo Amarelo/ letras Pretas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,

            // fontFamily: 'SourceSans'
          ),
        ),
      ),
    );
  }

  _tritanopiaThemeButton(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme(4);
        },
        child: const Text(
          'Fundo Branco/ letras Azuis',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,

            // fontFamily: 'SourceSans'
          ),
        ),
      ),
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
                Navigator.pushNamed(context, '/homeHomePage');
              },
              icon: const Icon(Icons.chevron_right_outlined),
            )),
      ],
    );
  }
}
