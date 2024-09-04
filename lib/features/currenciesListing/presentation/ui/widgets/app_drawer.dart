import 'package:currencies_converter/core/assets/assets.dart';
import 'package:currencies_converter/core/localization/presentation/localization_bloc/localization_bloc.dart';
import 'package:currencies_converter/core/localization/presentation/localization_bloc/localization_state.dart';
import 'package:currencies_converter/core/theming/presentation/theme_bloc/theme_bloc.dart';
import 'package:currencies_converter/core/theming/presentation/theme_bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.0.w,vertical: 10.h),
        child: Column(

          children: [
            Container(height:140.h ,child: Image.asset(AppAssets.currencyIcon),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.themeMode),
                Switch(
                    activeColor: Theme.of(context).primaryColor,
                    value:( context.read<ThemeBloc>().state as ThemeLoaded).themeMode == ThemeMode.light, onChanged: (val){
                  context.read<ThemeBloc>().add(ToggleThemeEvent());
                })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.english),
                Switch(
                    activeColor: Theme.of(context).primaryColor,
                    inactiveThumbColor: Theme.of(context).primaryColor,
                    inactiveTrackColor: Theme.of(context).secondaryHeaderColor,
                    value: ( context.read<LocalizationBloc>().state as LocalizationLoaded).currentLocalization == "en", onChanged: (val){
                  context.read<LocalizationBloc>().add(ChangeLocalizationEvent());
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
