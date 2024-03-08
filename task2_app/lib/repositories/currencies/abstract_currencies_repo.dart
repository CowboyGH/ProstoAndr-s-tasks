import 'package:task2_app/repositories/currencies/models/currency.dart';

abstract class AbstractCurrenciesRepo {
  Future<List<Currency>> getCurrenciesList();
}