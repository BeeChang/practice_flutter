import 'package:flutter/material.dart';
import 'package:practice_flutter/ui/route/CartScreen.dart';
import 'package:practice_flutter/ui/route/DetailScreen.dart';
import 'package:practice_flutter/ui/MainScreen.dart';
import 'package:practice_flutter/ui/route/PurchaseScreen.dart';
import 'package:practice_flutter/ui_component/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:practice_flutter/utils/string_extention.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //localization
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('ko'),

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/main': (context) => const MainScreen(),  // '/'대신 '/main' 사용
        '/detail': (context) => DetailScreen(),
        '/cart': (context) => CartScreen(),
        '/purchase': (context) => PurchaseScreen(),
      },
      initialRoute: '/main',  // 초기 라우트 설정
      home: const MainScreen(),
    );
  }
}


