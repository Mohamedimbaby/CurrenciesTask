import 'package:currencies_converter/features/currenciesListing/data/model/currency_model.dart';
import 'package:currencies_converter/features/currenciesListing/presentation/ui/widgets/country_flag_icon_network.dart';
import 'package:currencies_converter/features/currenciesListing/presentation/ui/widgets/file_country_flag_icon_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryFlagIcon extends StatelessWidget {
  final CurrencyData countryData;
  const CountryFlagIcon({super.key, required this.countryData});

  @override
  Widget build(BuildContext context) {
    return   Container(
        width: 50.r,
        height: 50.r,
        padding: EdgeInsets.all(8.r),
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white),
        ),
        child: countryData is CurrencyRemoteModel ? CountryFlagNetworkIcon(icon: (countryData as CurrencyRemoteModel).flag,):
        CountryFlagFileIcon(icon: (countryData as CurrencyLocalModel).flag,)
    );
  }
}
