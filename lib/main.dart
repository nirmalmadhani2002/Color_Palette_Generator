import 'package:color_pallate_generator_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'controllers/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      builder: (context, _) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff847ccc)),
            appBarTheme: const AppBarTheme(
              color: Color(0XFF6A62B7),
            ),
          ),
          darkTheme: ThemeData.dark(
            useMaterial3: true,
          ),
          themeMode: (Provider.of<ThemeProvider>(context).ld1.isDark == false)
              ? ThemeMode.light
              : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) =>  const HomaPage(),
            'colorsA': (context) =>  ColorsA(),
          },
        );
      },
    );
  }
}
