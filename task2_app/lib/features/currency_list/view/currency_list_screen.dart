import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2_app/features/currency_list/bloc/cubit.dart';
import 'package:task2_app/features/currency_list/bloc/states.dart';
import 'package:task2_app/features/currency_list/widgets/widgets.dart';

class CurrencyListScreen extends StatefulWidget {
  const CurrencyListScreen({super.key});
  @override
  State<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends State<CurrencyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dd-mm-yyyy'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: BlocBuilder<CurrencyCubit, CurrenciesListState> (
        builder: (context, state) {
          if (state is CurrenciesListInitState) {
            BlocProvider.of<CurrencyCubit>(context).getCurrenciesList();
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CurrenciesListLoaded) {
            return ListView.separated(  
              padding: const EdgeInsets.all(16),
              itemCount: state.currenciesList.length,
              itemBuilder: (context, i) {
                final currency = state.currenciesList[i];
                return CurrencyTile(currency: currency);
              }, 
              separatorBuilder: (context, i) => const Divider(), 
            );
          }

          if (state is CurrenciesListLoadError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.exception.toString()),
                    const SizedBox(height: 25),
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CurrencyCubit>(context).getCurrenciesList();
                      },
                      child: const Icon(Icons.restart_alt_outlined)
                    ),
                    const SizedBox(height: 8),
                    const Text('Click to restart.')
                  ],
                ),
              ),
            );
          }
          return const Divider();
        }
      ) 
    );
  }
}