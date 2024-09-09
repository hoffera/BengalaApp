import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../utils/constants.dart';
import '../utils/extra.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;
  late StreamSubscription<BluetoothAdapterState> _adapterStateStateSubscription;

  List<BluetoothDevice> _connectedDevices = [];
  List<ScanResult> _scanResults = [];
  bool _isScanning = false;
  late StreamSubscription<List<ScanResult>> _scanResultsSubscription;
  late StreamSubscription<bool> _isScanningSubscription;

  BluetoothDevice? targetDevice;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    bleInit();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (!_isScanning && targetDevice == null) {
          onScanning();
        }
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        onStopScanning();
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  void bleInit() {
    _adapterStateStateSubscription =
        FlutterBluePlus.adapterState.listen((state) {
      _adapterState = state;
      setState(() {});
    });

    FlutterBluePlus.systemDevices.then((devices) {
      _connectedDevices = devices;
      print(_connectedDevices.toString());
      setState(() {});
    });

    _scanResultsSubscription = FlutterBluePlus.scanResults.listen((results) {
      _scanResults = results;
      findTargetDevice(context);
    }, onError: (e) {});

    _isScanningSubscription = FlutterBluePlus.isScanning.listen((state) {
      _isScanning = state;
      setState(() {});
    });

    onScanning();
  }

  Future onScanning() async {
    try {
      int divisor = Platform.isAndroid ? 8 : 1;
      await FlutterBluePlus.startScan(
          timeout: null, continuousUpdates: true, continuousDivisor: divisor);
    } catch (e) {}
    setState(() {}); // force refresh of systemDevices
  }

  Future onStopScanning() async {
    try {
      FlutterBluePlus.stopScan();
    } catch (e) {}
  }

  void findTargetDevice(BuildContext context) async {
    print("PROCURANDO ESP");

    if (targetDevice?.isConnected ?? false) {
      print("Dispositivo já conectado");
      await _navigateToControlPage(context);
      return;
    }

    final index = _scanResults
        .indexWhere((item) => item.device.remoteId.str == DEVICE_MAC_ID);

    if (index >= 0) {
      targetDevice = _scanResults[index].device;

      onStopScanning();

      try {
        await targetDevice?.connectAndUpdateStream();
        print("Conectado ao dispositivo");
      } catch (e) {
        print("Erro ao conectar: $e");
        await targetDevice?.disconnectAndUpdateStream();
        onScanning();
        return;
      }

      if (targetDevice!.isConnected) {
        await Future.delayed(const Duration(seconds: 1));

        if (!context.mounted) return;
        await _navigateToControlPage(context);
      }
    } else {
      print("Dispositivo não encontrado");
    }
  }

  Future<void> _navigateToControlPage(BuildContext context) async {
    print("Navegando para a página de controle");
    var result = await Navigator.pushNamed(context, '/controllPage',
        arguments: targetDevice);

    if (result != null && result == true) {
      onScanning();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth'),
      ),
      body: Center(
        child: _adapterState == BluetoothAdapterState.on
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bluetooth_searching,
                    size: 100,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Procurando Bengala...",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bluetooth_disabled,
                    size: 100,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Bluetooth Desativado",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
