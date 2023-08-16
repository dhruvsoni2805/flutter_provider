import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/change_theme_provider.dart';
import 'package:flutter_provider/provider/count_provider.dart';
import 'package:flutter_provider/provider/favourite_provider.dart';
import 'package:flutter_provider/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CountProivder(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavouriateScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeChangeProvider(),
        )
      ],
      child: Builder(
        builder: (context) {
          final themeChanger = Provider.of<ThemeChangeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: themeChanger.thememode,
            home: const HomeScreen(),
          );
        },
      ),
    );

    ChangeNotifierProvider(
      create: (context) => CountProivder(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.system,
        home: const HomeScreen(),
      ),
    );
  }
}
