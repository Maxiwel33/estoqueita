import 'package:flutter/material.dart';

class PowerPage extends StatelessWidget {
  const PowerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Power'),
      ),
      body: Column(
        children: const [
          Text('Estamos em vendas'),
        ],
      ),
    );
  }
}
