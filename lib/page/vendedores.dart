import 'package:flutter/material.dart';

class Vendedores extends StatelessWidget {
  const Vendedores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vendedores'),
      ),
      body: Column(
        children: const [
          Text('Estamos em vendas'),
        ],
      ),
    );
  }
}
