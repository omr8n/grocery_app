// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce_shop_smart/Features/auth/data/repos/auth_repo_impl.dart';
// import 'package:e_commerce_shop_smart/Features/auth/domain/repos/auth_repo.dart';
// import 'package:e_commerce_shop_smart/core/repos/cart_repo/cart_repo.dart';
// import 'package:e_commerce_shop_smart/core/repos/cart_repo/cart_repo_impl.dart';
// import 'package:e_commerce_shop_smart/core/repos/images_repo/images_repo.dart';
// import 'package:e_commerce_shop_smart/core/repos/images_repo/images_repo_impl.dart';
// import 'package:e_commerce_shop_smart/core/repos/add_product_repo/add_products_repo_impl.dart';
// import 'package:e_commerce_shop_smart/core/services/supabase_stoarge.dart';
// import 'package:get_it/get_it.dart';

// import '../helper/navigation_service.dart';
// import '../repos/add_product_repo/add_products_repo.dart';
// import '../repos/products_repo/products_repo.dart';
// import '../repos/products_repo/products_repo_impl.dart';
// import '../repos/wishList_repo/wishlist_repo.dart';
// import '../repos/wishList_repo/wishlist_repo_impl';
// import 'data_service.dart';
// import 'firebase_auth_service.dart';
// import 'firestore_service.dart';
// import 'stoarage_service.dart';

// GetIt getIt = GetIt.instance;

// void setupLocator() {
//   getIt.registerSingleton<NavigationService>(NavigationService());
//   getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
//   getIt.registerSingleton<DatabaseService>(FireStoreService());
//   getIt.registerSingleton<AuthRepo>(
//     AuthRepoImpl(
//       firebaseAuthService: getIt<FirebaseAuthService>(),
//       databaseService: getIt<DatabaseService>(),
//     ),
//   );
//   getIt.registerSingleton<StoarageService>(SupabaseStoargeService());
//   getIt.registerSingleton<ImagesRepo>(
//     ImagesRepoImpl(getIt.get<StoarageService>()),
//   );
//   getIt.registerSingleton<AddProductsRepo>(
//     AddProductsRepoImpl(getIt.get<DatabaseService>()),
//   );
//   getIt.registerSingleton<ProductsRepo>(
//     ProductsRepoImpl(getIt<DatabaseService>()),
//   );
//   getIt.registerSingleton<CartRepo>(CartRepoImpl(getIt<DatabaseService>()));
//   getIt.registerSingleton<WishlistRepo>(
//     WishlistRepoImpl(getIt<DatabaseService>()),
//   );

//   // getIt.registerLazySingleton<NavigationService>(() => NavigationService());
//   //getIt.registerSingleton<ApiService>(ApiService());
//   // getIt.registerSingleton<MovieRepoImpl>(MovieRepoImpl(getIt<ApiService>()));
//   // getIt.registerLazySingleton<MovieRepo>(
//   //   () => MovieRepoImpl(getIt<ApiService>()),
//   // );
// }

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get_it/get_it.dart';
import 'package:grocery_app/core/repos/order_repo/order_repo.dart';

import '../../features/inner_screens/auth/data/repos/auth_repo_impl.dart';
import '../../features/inner_screens/auth/domain/repos/auth_repo.dart';
import '../repos/cart_repo/cart_repo.dart';
import '../repos/cart_repo/cart_repo_impl.dart';
import '../repos/order_repo/order_repo_impl.dart';
import '../repos/products_repo/products_repo.dart';
import '../repos/products_repo/products_repo_impl.dart';

import 'data_service.dart';
import 'firebase_auth_service.dart';
import 'firestore_service.dart';
import 'stoarage_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  //  getIt.registerSingleton<NavigationService>(NavigationService());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt.get<FirebaseAuthService>(),
      databaseService: getIt.get<DatabaseService>(),
    ),
  );

  //  getIt.registerSingleton<StoarageService>(SupabaseStoargeService());

  // getIt.registerSingleton<ImagesRepo>(
  //   ImagesRepoImpl(getIt.get<StoarageService>()),
  // );

  // getIt.registerSingleton<AddProductsRepo>(
  //   AddProductsRepoImpl(getIt.get<DatabaseService>()),
  // );

  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(getIt.get<DatabaseService>()),
  );

  getIt.registerSingleton<CartRepo>(CartRepoImpl(getIt.get<DatabaseService>()));
  // getIt.registerSingleton<WishlistRepo>(
  //   WishlistRepoImpl(getIt.get<DatabaseService>()),
  // );
  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(getIt.get<DatabaseService>()),
  );
}
