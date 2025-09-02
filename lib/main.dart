import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/core/providers/theme_provider.dart';
import 'package:grocery_app/features/home/presentation/views/home_view.dart';
import 'package:provider/provider.dart';

import 'core/helper/on_generate_routes.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'core/constants/theme_data.dart';
import 'features/root/presentation/views/root_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Prefs.init();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  ).then(
    (_) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return ThemeProvider();
          },
        )
      ],
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, themeProvider, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //   title: 'Flutter Demo',//
            // theme: ThemeData(

            //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            //   useMaterial3: true,
            // ),
            theme: Styles.themeData(
                isDarkTheme: themeProvider.getIsDarkTheme, context: context),
            initialRoute: RootView.routeName,
            onGenerateRoute: onGenerateRoute,
          );
        },
      ),
    );
  }
}
