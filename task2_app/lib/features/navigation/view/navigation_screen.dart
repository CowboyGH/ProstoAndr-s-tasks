import 'package:flutter/material.dart';
import 'package:task2_app/features/currency_list/currency_list.dart';
import 'package:task2_app/features/information/information.dart';
import 'package:task2_app/features/transactions/transactions.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentPageIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        selectedItemColor: Colors.brown,
        onTap: (int index) {
          _openPage(index);
        },
        
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About app',
          ),
        ],
      ),

      body: PageView(
        controller: _pageController,
        children: const [
          CurrencyListScreen(),
          TransactionsScreen(),
          InformationScreen()
        ],
      ),
    );
  }
  void _openPage(int index) {
    setState(() => _currentPageIndex = index);
    _pageController.animateToPage(
      index, 
      duration: const Duration(milliseconds: 250), 
      curve: Curves.linear
    );
  }
}