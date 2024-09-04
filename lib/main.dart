import 'package:currencies_converter/core/localization/presentation/localization_bloc/localization_bloc.dart';
import 'package:currencies_converter/core/localization/presentation/localization_bloc/localization_state.dart';
import 'package:currencies_converter/core/theming/presentation/theme_bloc/theme_bloc.dart';
import 'package:currencies_converter/core/theming/presentation/theme_bloc/theme_state.dart';
import 'package:currencies_converter/features/currenciesListing/presentation/ui/currencies_screen.dart';
import 'package:currencies_converter/injector/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ThemeBloc>()
            ..add(LoadThemeEvent()),
        ),
        BlocProvider(
          create: (context) => getIt<LocalizationBloc>()
            ..add(LoadLocalizationEvent()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is ThemeLoaded) {
            return BlocBuilder<LocalizationBloc, LocalizationState>(
              builder: (context, localizationState) {
                if(localizationState is LocalizationLoaded)
                {
                  return ScreenUtilInit(
                    designSize: const Size(360, 690),
                    minTextAdapt: true,
                    splitScreenMode: true,
                    builder:(_,child)=> MaterialApp(
                      debugShowCheckedModeBanner: false,
                      theme: state.lightTheme,
                      darkTheme: state.darkTheme,
                      themeMode: state.themeMode,
                      localizationsDelegates: const [
                        AppLocalizations.delegate, // Add this line
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      locale: Locale(localizationState.currentLocalization),
                      supportedLocales: const [
                        Locale('en'), // English
                        Locale('ar'), // Spanish
                      ],
                      home: const Scaffold(
                        body: CurrenciesScreen(),
                      ),
                    ),
                  );
                }
                return Container();
              }
            );
          }
          return Container();
        },
      ),
    );
  }
}
