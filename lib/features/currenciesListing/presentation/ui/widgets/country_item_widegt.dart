import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';
import 'package:currencies_converter/features/currenciesListing/presentation/ui/widgets/country_flag_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CountryItemWidget extends StatelessWidget {
  final CurrencyData country ;
  const CountryItemWidget({required this.country,super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(country.country),
      leading:
      CountryFlagIcon(countryData: (country)),
      trailing: Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        children: [
          Text(country.currency ?? ""),
          Text(AppLocalizations.of(context)!.inEGP(num.parse((1/ (country.price ?? 1.0)).toStringAsFixed(2)))),
        ],
      ),
    );
  }
}
