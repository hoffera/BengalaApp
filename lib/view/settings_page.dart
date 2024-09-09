import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _soundText = "Ligado";
  String _vibrationText = "Ligado";

  void _toggleSoundConfig() {
    // Alterna entre "Ligado" e "Desligado"
    setState(() {
      _soundText = _soundText == "Ligado" ? "Desligado" : "Ligado";
    });
  }

  void _toggleVibrateConfig() {
    setState(() {
      _vibrationText = _vibrationText == "Ligado" ? "Desligado" : "Ligado";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Configurações do D.A.V.I",
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
            _search(context),
            const SizedBox(height: 20.0),
            _volume(context),
            const SizedBox(height: 20.0),
            _vibration(context),
            const SizedBox(height: 20.0),
            _soundConfig(context),
            const SizedBox(height: 20.0),
            _volumeConfig(context),
            const SizedBox(height: 20.0),
            _searchConfig(context),
            const SizedBox(height: 20.0),
          ],
        )),
      ),
    );
  }

  _search(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/aaaa');
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Encontrar Davi",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _volume(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: _toggleSoundConfig,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Volume",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 100),
            Text(
              _soundText,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _vibration(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: _toggleVibrateConfig,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Vibração",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 100),
            Text(
              _vibrationText,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _soundConfig(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/aaaa');
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Configuração de Sons",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _volumeConfig(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/aaaa');
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Configuração de Volume",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _searchConfig(context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/aaaa');
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Configuração de navegação",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
