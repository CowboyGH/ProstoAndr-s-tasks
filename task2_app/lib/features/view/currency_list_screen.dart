import 'package:flutter/material.dart';

class CurrencyListScreen extends StatefulWidget {
  const CurrencyListScreen({super.key});
  @override
  State<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen> {
@override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dd-mm-yyyy'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: [IconButton(onPressed: () {
          // or navigation bar with routes
        }, icon: const Icon(Icons.menu))],
      ),
      body: const Center(child: CircularProgressIndicator()), // plug 
    );
  }
}