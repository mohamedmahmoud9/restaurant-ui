import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:resturant_ui/presentation/size_config.dart';
import 'package:resturant_ui/provider/categories.dart';
import 'package:resturant_ui/screens/intro_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:resturant_ui/widgets/girds/category_dishes_h.dart';

import 'app_localization.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Categories(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Resturant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(),
        primarySwatch: Colors.red,
        primaryColor: Colors.white,
        buttonTheme: ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        accentColor: Color(0xFFe30302),
        buttonColor: Color(0xFFe30302),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: [Locale('en', ''), Locale('ar', '')],
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: IntroScreen(),
      routes: {CategoryDishesGrid.routeName: (context) => CategoryDishesGrid()},
    );
  }
}

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(SizeConfig.safeBlockVertical);
    print(SizeConfig.blockSizeVertical);
    // final x = MediaQuery.of(context).padding.top;
    // print(x);
    return Scaffold(
      body: Column(children: [
        Container(
          color: Colors.red,
          height: SizeConfig.blockSizeVertical * 50,
        ),
        Container(
          color: Colors.blue,
          height: SizeConfig.blockSizeVertical * 50,
        ),
      ]),
    );
  }
}
