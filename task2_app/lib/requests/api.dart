import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:task2_app/repositories/currencies/models/currency.dart';
import 'package:xml2json/xml2json.dart';

Future<List<Currency>> loadCurrenciesList() async {
    try {
      final response = await Dio().get('https://www.cbr-xml-daily.ru/daily_utf8.xml');
      if (response.statusCode == 200) {
      final xml2json = Xml2Json(); 
      final xmlString = response.data;
      xml2json.parse(xmlString);
      final jsonString = xml2json.toBadgerfish();
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;

      final dataValCurs = jsonData['ValCurs'] as Map<String, dynamic>;
      final dataValute =  dataValCurs['Valute'] as List;
      final String date = dataValCurs['@Date'];
      

      final currenciesList = <Currency>[];

      for (int i = 0; i < dataValute.length; i++) {
        final name = dataValute[i]['Name']['\$'];
        final charCode = dataValute[i]['CharCode']['\$'];
        final value = dataValute[i]['Value']['\$'];
        
        currenciesList.add(Currency(
          name: name, 
          charCode: charCode, 
          value: value
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