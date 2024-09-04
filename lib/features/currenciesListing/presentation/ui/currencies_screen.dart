import 'package:currencies_converter/features/currenciesListing/presentation/bloc/currencies_bloc.dart';
import 'package:currencies_converter/features/currenciesListing/presentation/bloc/currencies_state.dart';
import 'package:currencies_converter/features/currenciesListing/presentation/ui/widgets/app_drawer.dart';
import 'package:currencies_converter/features/currenciesListing/presentation/ui/widgets/country_item_widegt.dart';
import 'package:currencies_converter/features/currenciesListing/presentation/ui/widgets/most_used_currency_section.dart';
import 'package:currencies_converter/features/currencyConverter/presentation/bloc/converter_bloc.dart';
import 'package:currencies_converter/features/currencyConverter/presentation/ui/currency_converter_screen.dart';
import 'package:currencies_converter/injector/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CurrenciesBloc>()..add(LoadCurrenciesEvent()),
      child: BlocBuilder<CurrenciesBloc,CurrenciesState>(
        builder: (context, state) {
          return Scaffold(
            drawer: const AppDrawer(),
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                AppLocalizations.of(context)!.currencies_app,
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 8.0.w),
                  child: GestureDetector(
                    onTap: () => state is CurrenciesLoaded ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>  BlocProvider<ConverterBloc>(
                              create: (BuildContext context) => getIt<ConverterBloc>(),
                          child: CurrencyConverterScreen(currencies:state.currencies ,)))): (){},
                    child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Theme.of(context).primaryColor,
                        child: Icon(
                          Icons.cached,
                          color: Theme.of(context).iconTheme.color,
                        )),
                  ),
                )
              ],
            ),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  expandedHeight: 200.0,
                  leading: const SizedBox(),
                  flexibleSpace: FlexibleSpaceBar(
                    title: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .currency_today_price,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              state is CurrenciesLoaded ?
                              AppLocalizations.of(context)!.inEGP(num.parse((1/ (state.favoriteCurrencyPrice)).toStringAsFixed(2))):
                              "",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    titlePadding:
                    EdgeInsets.symmetric(vertical: 40.h, horizontal: 40.w),
                    background: const MostUsedCurrencySection(),
                  ),
                ),
                state is CurrenciesLoaded
                    ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 8.h,
                          ),
                          CountryItemWidget(
                              country: state.currencies[index]),
                          SizedBox(
                            height: 8.h,
                          ),
                          Divider(
                            endIndent: 12.w,
                            indent: 12.w,
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(.2),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                        ],
                      );
                    },
                    childCount: state.currencies.length,
                  ),
                )
                    : state is CurrenciesError
                    ? SliverFillRemaining(
                  child: Center(
                    child: Text(state.error),
                  ),
                )
                    : const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            )
            );
        }
      ),
    );
  }
}
