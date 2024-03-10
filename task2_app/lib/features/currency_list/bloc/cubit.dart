import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:task2_app/features/currency_list/bloc/states.dart';
import 'package:task2_app/repositories/currencies/models/currency.dart';
import 'package:task2_app/requests/api.dart';

class CurrencyCubit extends Cubit<CurrenciesListState> {
  CurrencyCubit() : super(CurrenciesListLoading());

  Future<void> getCurrenciesList() async {
    try {
      List<Currency> currenciesList = await loadCurrenciesList();
      emit(CurrenciesListLoaded(currenciesList: currenciesList));
      return;
    } catch (e) {
      emit(CurrenciesListLoadError(e));
      return;
    }
  }
}