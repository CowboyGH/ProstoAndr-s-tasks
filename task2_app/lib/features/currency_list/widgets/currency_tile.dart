import 'package:flutter/material.dart';
import 'package:task2_app/repositories/currencies/models/currency.dart';

class CurrencyTile extends StatelessWidget {
  final Currency currency;
  const CurrencyTile({super.key, required this.currency});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(currency.charCode),
      title: Text(currency.name),
      subtitle: Text(currency.value as String),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // open convert menu
      },
    );
  }
}