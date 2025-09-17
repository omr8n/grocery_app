// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../Features/edit/domain/entities/product_entity.dart';

// import '../../repos/products_repo/products_repo.dart';

// part 'products_state.dart';

// // class ProductsCubit extends Cubit<ProductsState> {
// //   ProductsCubit(this.productsRepo) : super(ProductsInitial());

// //   final ProductsRepo productsRepo;
// //   int productsLength = 0;
// //   StreamSubscription? _streamSubscription;
// //   Future<void> getProducts() async {
// //     emit(ProductsLoading());

// //     _streamSubscription = productsRepo.getProducts().listen((result) {
// //       result.fold(
// //         (failure) => emit(ProductsFailure(failure.message)),
// //         (products) => emit(ProductsSuccess(products)),
// //       );
// //     });
// //     // final Either<Failure, List<ProductEntity>> result =
// //     //     await productsRepo.getProducts();
// //   }

// //   @override
// //   Future<void> close() {
// //     _streamSubscription?.cancel();
// //     return super.close();
// //   }

// //   // Future<void> getBestSellingroducts() async {
// //   //   emit(ProductsLoading());
// //   //   final Either<Failure, List<ProductEntity>> result =
// //   //       await productsRepo.getBestSellingProducts();
// //   //   result.fold((failure) => emit(ProductsFailure(failure.message)), (
// //   //     products,
// //   //   ) {
// //   //     productsLength = products.length;
// //   //     emit(ProductsSuccess(products));
// //   //   });
// //   // }
// // }

// // class ProductsCubit extends Cubit<ProductsState> {
// //   ProductsCubit(this.productsRepo) : super(ProductsInitial());

// //   final ProductsRepo productsRepo;
// //   StreamSubscription? _streamSubscription;
// //   List<ProductEntity> _allProducts = [];

// //   Future<void> getProducts() async {
// //     emit(ProductsLoading());

// //     _streamSubscription = productsRepo.getProducts().listen((result) {
// //       result.fold((failure) => emit(ProductsFailure(failure.message)), (
// //         products,
// //       ) {
// //         _allProducts = products;
// //         emit(ProductsSuccess(products));
// //       });
// //     });
// //   }

// // void searchProducts({
// //   required String searchText,
// //   required List<ProductEntity> productsList,
// // }) {
// //   final List<ProductEntity> searchList =
// //       productsList.where((product) {
// //         return product.name.toLowerCase().contains(searchText.toLowerCase());
// //       }).toList();

// //   emit(ProductsSuccess(searchList));
// // }

// // void resetProducts() {
// //   emit(ProductsSuccess(_allProducts));
// // }

// //   @override
// //   Future<void> close() {
// //     _streamSubscription?.cancel();
// //     return super.close();
// //   }
// // }

// class ProductsCubit extends Cubit<ProductsState> {
//   ProductsCubit(this.productsRepo) : super(ProductsInitial());

//   final ProductsRepo productsRepo;
//   int productsLength = 0;
//   StreamSubscription? _streamSubscription;

//   List<ProductEntity> _allProducts = [];
//   // Future<void> getProducts() async {
//   //   emit(ProductsLoading());

//   //   _streamSubscription = productsRepo.getProducts().listen((result) {
//   //     result.fold(
//   //       (failure) => emit(ProductsFailure(failure.message)),
//   //       (products) {
//   //         _allProducts = products.reversed.toList();
//   //         emit(ProductsSuccess(_allProducts));
//   //       },
//   //     );
//   //   });
//   // }
//   Future<void> getProducts() async {
//     emit(ProductsLoading());

//     _streamSubscription = productsRepo.getProducts().listen((result) {
//       result.fold((failure) => emit(ProductsFailure(failure.message)), (
//         products,
//       ) {
//         _allProducts = products.reversed.toList();
//         emit(ProductsSuccess(_allProducts));
//       });
//     });
//   }

//   ProductEntity? findByProdId(String productId) {
//     if (state is ProductsSuccess) {
//       final products = (state as ProductsSuccess).products;
//       try {
//         return products.firstWhere((product) => product.productId == productId);
//       } catch (e) {
//         return null;
//       }
//     }
//     return null;
//   }

//   void filterByCategory({required String categoryName}) {
//     final List<ProductEntity> filteredList =
//         _allProducts
//             .where(
//               (product) => product.category.toLowerCase().contains(
//                 categoryName.toLowerCase(),
//               ),
//             )
//             .toList();

//     emit(ProductsSuccess(filteredList));
//   }

// void searchProducts({
//   required String searchText,
//   required List<ProductEntity> productsList,
// }) {
//   final List<ProductEntity> searchList =
//       productsList.where((product) {
//         return product.name.toLowerCase().contains(searchText.toLowerCase());
//       }).toList();

//   emit(ProductsSuccess(searchList));
// }

//   void resetProducts() {
//     emit(ProductsSuccess(_allProducts));
//   }

//   @override
//   Future<void> close() {
//     _streamSubscription?.cancel();
//     return super.close();
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../Features/edit/domain/entities/product_entity.dart';
import '../../entites/product_entity.dart';
import '../../repos/products_repo/products_repo.dart';

part 'products_state.dart';

// class ProductsCubit extends Cubit<ProductsState> {
//   ProductsCubit(this.productsRepo) : super(ProductsInitial());

//   final ProductsRepo productsRepo;
//   StreamSubscription? streamSubscription;

//   List<ProductEntity> _allProducts = [];

//   Future<void> getProducts() async {
//     emit(ProductsLoading());

//     streamSubscription = productsRepo.getProducts().listen((result) {
//       result.fold((failure) => emit(ProductsFailure(failure.message)), (
//         products,
//       ) {
//         _allProducts = products;
//         emit(ProductsSuccess(products.reversed.toList()));
//       });
//     });
//   }

//   ProductEntity? findByProdId(String productId) {
//     try {
//       return _allProducts.firstWhere(
//         (product) => product.productId == productId,
//       );
//     } catch (e) {
//       return null;
//     }
//   }

//   void filterByCategory({required String categoryName}) {
//     final List<ProductEntity> filteredList = _allProducts
//         .where(
//           (product) => product.category.toLowerCase().contains(
//             categoryName.toLowerCase(),
//           ),
//         )
//         .toList();

//     emit(ProductsSuccess(filteredList.reversed.toList()));
//   }

//   void searchProducts({
//     required String searchText,
//     required List<ProductEntity> productsList,
//   }) {
//     final List<ProductEntity> searchList = productsList.where((product) {
//       return product.name.toLowerCase().contains(searchText.toLowerCase());
//     }).toList();

//     emit(ProductsSuccess(searchList.reversed.toList()));
//   }

//   void resetProducts() {
//     emit(ProductsSuccess(_allProducts.reversed.toList()));
//   }

//   // @override
//   // Future<void> close() {
//   //   _streamSubscription?.cancel();
//   //   return super.close();
//   // }
// }
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;
  StreamSubscription? streamSubscription;

  List<ProductEntity> _allProducts = [];
  List<ProductEntity> _filteredProducts = [];

  List<ProductEntity> get allProducts => _allProducts;
  List<ProductEntity> get filteredProducts => _filteredProducts;

  Future<void> getProducts() async {
    emit(ProductsLoading());

    streamSubscription = productsRepo.getProducts().listen((result) {
      result.fold((failure) => emit(ProductsFailure(failure.message)), (
        products,
      ) {
        _allProducts = products;
        _filteredProducts = []; // نفرغ الفلترة عند التحميل
        emit(ProductsSuccess(products.reversed.toList()));
      });
    });
  }

  // List<ProductEntity> get onSaleProducts =>
  //     _allProducts.where((p) => p.isOnSale && p.salePrice != null).toList();

  // void searchOnSale(String query) {
  //   final filtered = onSaleProducts
  //       .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
  //       .toList();
  //   emit(ProductsSuccess(filtered));
  // }

  ProductEntity? findByProdId(String productId) {
    try {
      return _allProducts.firstWhere(
        (product) => product.productId == productId,
      );
    } catch (e) {
      return null;
    }
  }

  void filterByCategory({required String categoryName}) {
    _filteredProducts = _allProducts
        .where(
          (product) => product.category.toLowerCase().contains(
            categoryName.toLowerCase(),
          ),
        )
        .toList();

    emit(ProductsSuccess(_filteredProducts.reversed.toList()));
  }

  void searchProducts({
    required String searchText,
    required List<ProductEntity> productsList,
  }) {
    _filteredProducts = productsList
        .where(
          (product) =>
              product.name.toLowerCase().contains(searchText.toLowerCase()),
        )
        .toList();

    emit(ProductsSuccess(_filteredProducts.reversed.toList()));
  }

  void resetProducts() {
    _filteredProducts = [];
    emit(ProductsSuccess(_allProducts.reversed.toList()));
  }

  bool get hasFilter => _filteredProducts.isNotEmpty;
}
