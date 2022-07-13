import 'package:flutter/material.dart';
import 'package:meal_app/provider/favorite_meal_provider.dart';
import 'package:meal_app/provider/filter_meal_provider.dart';
import 'package:meal_app/routes/routes.dart';
import 'package:meal_app/values/strings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FilterMealProvider()),
    ChangeNotifierProvider(create: (_) => FavoriteMealProvider()),
  ], child: const MyApp()));
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey, // set property
      routes: Routes.getRoutes(),
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              // titleLarge: const TextStyle(
              //   fontSize: 24,
              //   fontFamily: 'RobotoCondensed',
              // ),
              // titleMedium: const TextStyle(
              //   fontSize: 18,
              //   fontFamily: 'RobotoCondensed',
              // ),
              // titleSmall: const TextStyle(
              //   fontSize: 15,
              //   fontFamily: 'RobotoCondensed',
              // ),
            ),
      ),
      initialRoute: Routes.tabsScreen,
    );
  }
}

// 7 - 24
