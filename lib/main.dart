import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ProductAlternativesApp());
}

class ProductAlternativesApp extends StatelessWidget {
  const ProductAlternativesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canadian Alternatives',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _scanResult = 'No scan yet';

  Future<void> _scanBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Scanner line color
        'Cancel', // Cancel button text
        true, // Show flash icon
        ScanMode.BARCODE,
      );
      
      if (!mounted) return;

      setState(() {
        _scanResult = barcodeScanRes != '-1' ? barcodeScanRes : 'Scan cancelled';
      });
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Canadian Alternatives'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _scanBarcode,
              child: const Text('Scan Product'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement manual search
              },
              child: const Text('Search Product'),
            ),
            const SizedBox(height: 20),
            Text('Scan Result: $_scanResult'),
          ],
        ),
      ),
    );
  }
} 