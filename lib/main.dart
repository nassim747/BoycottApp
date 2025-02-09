import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

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
              onPressed: () {
                // TODO: Implement barcode scanner
              },
              child: const Text('Scan Product'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement manual search
              },
              child: const Text('Search Product'),
            ),
          ],
        ),
      ),
    );
  }
} 