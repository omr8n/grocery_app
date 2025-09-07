import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:grocery_app/core/services/init_getit.dart';

import 'package:grocery_app/features/home/presentation/views/home_view.dart';
import 'package:provider/provider.dart';

import 'core/cubits/theme_cubit/theme_cubit.dart';
import 'core/cubits/theme_cubit/theme_state.dart';
import 'core/helper/on_generate_routes.dart';
import 'core/repos/products_repo/products_repo.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'core/constants/theme_data.dart';
import 'features/root/presentation/views/root_view.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupLocator();
  await Prefs.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<ProductsCubit>(
          create: (_) =>
              ProductsCubit(getIt.get<ProductsRepo>())..getProducts(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state is LightThemeState
                ? MyThemeData.lightTheme
                : MyThemeData.darkTheme,
            initialRoute: RootView.routeName,
            onGenerateRoute: onGenerateRoute,
          );
        },
      ),
    );
  }
}
