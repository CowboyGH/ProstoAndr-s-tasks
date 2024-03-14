import 'package:flutter/material.dart';
import 'package:task2_app/repositories/currencies/models/currency.dart';

class CurrencyTile extends StatefulWidget {
  final Currency currency;
  const CurrencyTile({super.key, required this.currency});

  @override
  State<CurrencyTile> createState() => _CurrencyTileState();
}

class _CurrencyTileState extends State<CurrencyTile> {
  String text = '';
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(widget.currency.charCode),
      title: Text(widget.currency.name),
      subtitle: Text('${widget.currency.value}'),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          // insetAnimationCurve: Curves.linear,
          // insetAnimationDuration: const Duration(milliseconds: 250),
          child: SizedBox(
            height: 275,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Конвертация валюты',
                    style: TextStyle(
                      fontWeight: FontWeight.w900, 
                      fontSize: 20
                    )
                  ),
                  const SizedBox(height: 16),
                  Text(widget.currency.charCode, textAlign: TextAlign.left,),
                   TextField(
                    decoration: const InputDecoration(
                      labelText: 'Введите сумму',
                      icon: Icon(Icons.money)
                    ),
                    onChanged: (userText) {
                      setState(() {
                        text = userText;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text('RUB'),
                  const Text('text * widget.currency.value'), // !!!
                  const SizedBox(height: 32),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      child: const Text('Конвертировать'),
                      onPressed: () {
                        setState(() {
                          
                        });
                      }
                    )
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}