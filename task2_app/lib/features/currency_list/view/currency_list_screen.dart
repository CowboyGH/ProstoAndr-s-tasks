import 'package:flutter/material.dart';

class CurrencyListScreen extends StatefulWidget {
  const CurrencyListScreen({super.key});
  @override
  State<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen> {
  int _currentPageIndex = 0;
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
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPageIndex,
        onTap: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
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
      body: const Center(child: CircularProgressIndicator()), // plug 
    );
  }
}