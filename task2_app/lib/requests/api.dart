import 'package:dio/dio.dart';
import 'package:task2_app/repositories/currencies/models/currency.dart';
import 'package:xml/xml.dart';

Future<List<Currency>> getCurrenciesList() async {
    final response = await Dio().get('http://www.cbr.ru/scripts/XML_daily.asp');

    if (response.statusCode == 200) {
      final document = XmlDocument.parse(response.data);
      final rootElement = document.findAllElements('Valute').first;
      final currenciesList = <Currency>[];

      for (final element in rootElement.children) {
        final code = element.getAttribute('CharCode');
        final name = element.getAttribute('Name');
        final value = element.findElements('Value').first;
        currenciesList.add(Currency(
          name: name!,
          charCode: code!,
          value: double.parse(value as String)
        ));
      }
      return currenciesList;
    } else {
      throw Exception('Ошибка загрузки XML: ${response.statusCode}');
      }
}