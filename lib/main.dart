import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/cubits/orders_cubit/orders_cubit.dart';
import 'package:grocery_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:grocery_app/core/cubits/viewed_recently_cubit/viewed_recently_cubit.dart';
import 'package:grocery_app/core/repos/order_repo/order_repo.dart';
import 'package:grocery_app/core/repos/wishlist_repo/wishlist_repo.dart';
import 'package:grocery_app/core/services/init_getit.dart';
import 'package:grocery_app/features/inner_screens/fetch_screen.dart';

import 'core/cubits/theme_cubit/theme_cubit.dart';
import 'core/cubits/theme_cubit/theme_state.dart';
import 'core/cubits/wishlist_cubit/wishlist_cubit.dart';
import 'core/helper/on_generate_routes.dart';
import 'core/repos/cart_repo/cart_repo.dart';
import 'core/repos/products_repo/products_repo.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'core/constants/theme_data.dart';
import 'features/cart/presentation/manger/cubits/cart_cubit/cart_cubit.dart';
// import 'features/cart/presentation/manger/cubits/cart_item_cubit/cart_item_cubit.dart';
// import 'features/root/presentation/views/root_view.dart';
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
          create: (_) => ProductsCubit(getIt.get<ProductsRepo>()),
        ),
        BlocProvider<CartCubit>(
          create: (_) => CartCubit(getIt.get<CartRepo>()),
        ),
        BlocProvider<OrdersCubit>(
          create: (_) => OrdersCubit(getIt.get<OrdersRepo>()),
        ),
        BlocProvider<WishlistCubit>(
          create: (_) => WishlistCubit(getIt.get<WishlistRepo>()),
        ),
        BlocProvider<ViewedProdCubit>(create: (_) => ViewedProdCubit()),
        //   BlocProvider<CartItemCubit>(create: (_) => CartItemCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state is LightThemeState
                ? MyThemeData.lightTheme
                : MyThemeData.darkTheme,
            initialRoute: FetchScreen.routeName,
            onGenerateRoute: onGenerateRoute,
          );
        },
      ),
    );
  }
}
