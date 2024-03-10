import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2_app/features/currency_list/bloc/cubit.dart';
import 'package:task2_app/features/navigation/view/navigation_screen.dart';
import 'theme/theme.dart';

class CurrencyListApp extends StatelessWidget {
  const CurrencyListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: mainTheme,
      home: BlocProvider(
        create: (context) => CurrencyCubit(),
        child: const NavigationScreen(),
      ),
    );
  }
}