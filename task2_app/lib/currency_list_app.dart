import 'package:flutter/material.dart';
import 'package:task2_app/features/view/currency_list_screen.dart';

class CurrencyListApp extends StatelessWidget {
  const CurrencyListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dd-mm-yyyy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CurrencyListScreen(),
    );
  }
}