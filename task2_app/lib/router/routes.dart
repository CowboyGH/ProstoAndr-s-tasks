import 'package:task2_app/features/currency_list/view/currency_list_screen.dart';
import 'package:task2_app/features/information/view/information_screen.dart';
import 'package:task2_app/features/transactions/view/transactions_screen.dart';

final routes = 
{
  '/': (context) => const CurrencyListScreen(),
  '/history': (context) => const InformationScreen(),
  '/info': (context) => const TransactionsScreen()
};