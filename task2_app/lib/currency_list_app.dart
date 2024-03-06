import 'package:flutter/material.dart';
import 'package:task2_app/features/currency_list/view/currency_list_screen.dart';
import 'package:task2_app/router/routes.dart';
import 'theme/theme.dart';

class CurrencyListApp extends StatelessWidget {
  const CurrencyListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      routes: routes,
      home: const CurrencyListScreen(),
    );
  }
}