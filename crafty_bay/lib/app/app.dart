import 'package:crafty_bay/app/provider/language_provider.dart';
import 'package:crafty_bay/app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../features/auth/presentation/screens/splash_screen.dart';
import '../features/category/presentation/provider/category_list_provider.dart';
import '../features/common/presentation/provider/main_nav_container_provider.dart';
import '../features/home/presentation/providers/home_slider_provider.dart';
import '../l10n/app_localizations.dart';
import 'app_routes.dart';
import 'app_theme.dart';
class CraftyBayApp extends StatefulWidget {
  const CraftyBayApp({super.key});
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<CraftyBayApp> createState() => _CraftyBayAppState();
}

class _CraftyBayAppState extends State<CraftyBayApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()..loadInitialLanguage()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()..loadInitialTheme()),
        ChangeNotifierProvider(create: (_) => MainNavContainerProvider()),
        ChangeNotifierProvider(create: (_) => CategoryListProvider()),
        ChangeNotifierProvider(create: (_) => HomeSliderProvider()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                navigatorKey: CraftyBayApp.navigatorKey,
                initialRoute: SplashScreen.name,
                onGenerateRoute: AppRoutes.route,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.drakTheme,
                themeMode: themeProvider.currentThemeMode,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale('en'),
                  Locale('bn'),
                ],
                locale: languageProvider.currentLocale,
              );
            }
          );
        }
      ),
    );
  }
}
