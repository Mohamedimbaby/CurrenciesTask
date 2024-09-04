import 'package:currencies_converter/core/extensions/extension.dart';
import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';
import 'package:currencies_converter/features/currencyConverter/presentation/bloc/converter_bloc.dart';
import 'package:currencies_converter/features/currencyConverter/presentation/bloc/converter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class CurrencyConverterScreen extends StatefulWidget {
  final List<CurrencyData> currencies  ;

  const CurrencyConverterScreen({required this.currencies,super.key});

  @override
  CurrencyConverterScreenState createState() => CurrencyConverterScreenState();
}

class CurrencyConverterScreenState extends State<CurrencyConverterScreen> {

  late BehaviorSubject<CurrencyData> _fromCurrency;
  late BehaviorSubject<CurrencyData> _toCurrency;
  final TextEditingController _amountController = TextEditingController();
  @override
  void initState() {
    _fromCurrency =BehaviorSubject<CurrencyData>.seeded(widget.currencies.getUSDCurrency());
    _toCurrency =BehaviorSubject<CurrencyData>.seeded(widget.currencies.getEURCurrency());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // From Currency Dropdown
            StreamBuilder<CurrencyData>(
              stream: _fromCurrency.stream,
              builder: (context, value) {
                return DropdownButton<CurrencyData>(
                  value: value.data,
                  onChanged: (CurrencyData? newValue) => _fromCurrency.add(newValue!),
                  items: widget.currencies.map<DropdownMenuItem<CurrencyData>>((CurrencyData value) {
                    return DropdownMenuItem<CurrencyData>(
                      value: value,
                      child: Text(value.currency??""),
                    );
                  }).toList(),
                  isExpanded: true,
                );
              }
            ),

            const SizedBox(height: 16.0),

            // To Currency Dropdown
            StreamBuilder<CurrencyData>(
              stream: _toCurrency.stream,
              builder: (context, value) {
                return DropdownButton<CurrencyData>(
                  value: value.data,
                  onChanged: (CurrencyData? newValue) => _toCurrency.add,
                  items: widget.currencies.map<DropdownMenuItem<CurrencyData>>((CurrencyData value) {
                    return DropdownMenuItem<CurrencyData>(
                      value: value,
                      child: Text(value.currency ?? ""),
                    );
                  }).toList(),
                  isExpanded: true,
                );
              }
            ),

            const SizedBox(height: 16.0),

            // Amount Input
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<ConverterBloc>().add(LoadConverterEvent( from: _fromCurrency.value.price??0, to: _toCurrency.value.price??0, amount: value.isNotEmpty ? num.parse(value):0));
              },
            ),
            const SizedBox(height: 16.0),

            // Converted Amount Display
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: BlocBuilder<ConverterBloc,ConverterState>(
                    builder: (BuildContext context, state) {
                      if (state is ConverterLoaded) {
                        return Text(
                        'Converted Amount: ${_amountController.text} ${_fromCurrency.value.currency} = ${state.value.toStringAsFixed(2)} ${_toCurrency.value.currency}',
                      style: Theme.of(context).textTheme.headlineSmall,
                        );
                      }
                      return Text("Converted Amount:",
                        style: Theme.of(context).textTheme.headlineSmall,
                      );
                    },

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


}


