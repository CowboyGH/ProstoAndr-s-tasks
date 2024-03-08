import 'package:equatable/equatable.dart';
import 'package:task2_app/repositories/currencies/models/currency.dart';

abstract class CurrenciesListState extends Equatable{}

class CurrenciesListLoading extends CurrenciesListState {
  @override
  List<Object?> get props => [];
}

class CurrenciesListLoaded extends CurrenciesListState {
  final List<Currency> currenciesList;
  CurrenciesListLoaded({required this.currenciesList});

  @override
  List<Object?> get props => [currenciesList];
}

class CurrenciesListLoadError extends CurrenciesListState {
  final Object? exception;
  CurrenciesListLoadError(this.exception);
  
  @override
  List<Object?> get props => [exception];
}