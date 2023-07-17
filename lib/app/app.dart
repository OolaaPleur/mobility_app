import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:mobility_app/data/repositories/settings_repository.dart';
import 'package:mobility_app/screens/settings/language_cubit/language_cubit.dart';
import 'package:mobility_app/theme/bloc/theme_bloc.dart';
import 'package:mobility_app/theme/bloc/theme_state.dart';

import '../screens/home/widgets/onboarding_widget.dart';
import '../screens/intro/intro.dart';

/// Entry widget of the app.
class MyApp extends StatefulWidget {
  /// Entry widget constructor.
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _settingsRepository = GetIt.I<SettingsRepository>();
  late Future<bool> firstLoadFuture;

  @override
  void initState() {
    super.initState();
    firstLoadFuture = _settingsRepository.getBoolValue('first_load');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, theme) {
        return BlocProvider(
          create: (context) => LanguageCubit(),
          child: Builder(
            builder: (context) {
              final locale = context.watch<LanguageCubit>().state;
              return MaterialApp(
                locale: locale,
                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  return supportedLocales.contains(deviceLocale)
                      ? deviceLocale
                      : supportedLocales.first;
                },
                theme: theme.themeData,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                home: FutureBuilder<bool>(
                  future: firstLoadFuture, // Use the future from initState
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.data == false) {
                        return const Intro();
                      }
                      else {
                        return const OnboardingWidget();
                      }
                    } else {
                      return const Scaffold(
                        body: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ); // While data is loading
                    }
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}