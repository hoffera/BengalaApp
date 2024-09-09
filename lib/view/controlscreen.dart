import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ControlScreen extends StatefulWidget {
  final BluetoothDevice device;

  const ControlScreen({super.key, required this.device});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  BluetoothConnectionState _connectionState =
      BluetoothConnectionState.disconnected;
  final bool _isConnecting = false;
  final bool _isDisconnecting = false;
  late BluetoothCharacteristic _characteristicRX;

  late StreamSubscription<BluetoothConnectionState>
      _connectionStateSubscription;

  @override
  void initState() {
    super.initState();

    _connectionStateSubscription =
        widget.device.connectionState.listen((state) async {
      setState(() {
        _connectionState = state;
      });

      if (state == BluetoothConnectionState.disconnected) {
        Navigator.pushNamed(context, '/homePage');
      }
    });

    _initCharacteristic();
    _startReconnectionLoop();
  }

  Timer? _reconnectionTimer;
  bool _isReconnecting = false;

  void _startReconnectionLoop() {
    // Define o intervalo de tempo para tentar reconectar (por exemplo, 5 segundos)
    const reconnectionInterval = Duration(seconds: 5);

    // Timer que verifica periodicamente o estado da conexão
    _reconnectionTimer = Timer.periodic(reconnectionInterval, (timer) {
      print("...");
      if (_connectionState == BluetoothConnectionState.disconnected) {
        print("Tentando reconectar...");

        // Lógica de reconexão pode ser adicionada aqui se necessário

        // Navega para a página de navegação se desconectado
        Navigator.pushNamed(context, '/NavPage');
      } else {
        // Para o timer e atualiza o status de reconexão
        timer.cancel();
        _reconnectionTimer = null;
        _isReconnecting = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initCharacteristic() async {
    List<BluetoothService> services = await widget.device.discoverServices();
    BluetoothService service = services.firstWhere(
      (s) => s.uuid.toString() == "fc96f65e-318a-4001-84bd-77e9d12af44b",
    );
    _characteristicRX = service.characteristics.firstWhere(
      (c) => c.uuid.toString() == "04d3552e-b9b3-4be6-a8b4-aa43c4507c4d",
    );
  }

  Future<void> _toggleLED(bool turnOn) async {
    Uint8List value = Uint8List.fromList(turnOn ? [1] : [0]);
    await _characteristicRX.write(value);
  }

  Future<void> _toggle2() async {
    Uint8List value = Uint8List.fromList([2]);
    await _characteristicRX.write(value);
  }

  Future<void> _toggle3() async {
    Uint8List value = Uint8List.fromList([55]);
    await _characteristicRX.write(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _toggleLED(true); // Ligando o LED
              },
              child: const Text('Ligar LED'),
            ),
            ElevatedButton(
              onPressed: () {
                _toggleLED(false); // Desligando o LED
              },
              child: const Text('Desligar LED'),
            ),
            ElevatedButton(
              onPressed: () {
                _toggle2();
              },
              child: const Text('Enviar 2'),
            ),
            ElevatedButton(
              onPressed: () {
                _toggle3();
              },
              child: const Text('Enviar 55'),
            ),
            const SizedBox(height: 20),
            if (_isConnecting || _isDisconnecting)
              const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
