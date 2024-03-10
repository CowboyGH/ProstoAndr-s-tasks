import 'package:dio/dio.dart';
import 'package:task2_app/repositories/currencies/models/currency.dart';
import 'package:xml/xml.dart';

Future<List<Currency>> loadCurrenciesList() async {
    try {
      final response = await Dio().get('http://www.cbr.ru/scripts/XML_daily.asp');

    if (response.statusCode == 200) {
      final document = XmlDocument.parse(response.data);
      final mainElement = document.findAllElements('Valute').first;
      final date = document.getAttribute('Date');
      final currenciesList = <Currency>[];

      for (final element in mainElement.children) {
        final name = element.getAttribute('Name');
        final code = element.getAttribute('CharCode');
        final value = element.getAttribute('Value');
        currenciesList.add(Currency(
          name: name!,
          charCode: code!,
          value: value!
        ));
      }
      return currenciesList;
    } else {
      throw Exception('Ошибка загрузки XML: ${response.statusCode}');
    }
    } catch (e) {
      throw Exception('Ошибка загрузки валют: $e');
    }
}