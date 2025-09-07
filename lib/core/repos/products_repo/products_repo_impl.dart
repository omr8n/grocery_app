import 'dart:developer';

import 'package:dartz/dartz.dart';

// import '../../../Features/edit/domain/entities/product_entity.dart';
import '../../entites/product_entity.dart';
import '../../errors/failures.dart';
// import '../../models/product_model.dart';
import '../../models/products_model.dart';
import '../../services/data_service.dart';
import '../../utils/backend_endpoint.dart';
import 'products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  // @override
  // Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
  //   try {
  //     List<Map<String, dynamic>> data =
  //         await databaseService.getData(
  //               path: BackendEndpoint.getProducts,
  //               query: {
  //                 'limit': 10,
  //                 'orderBy': 'sellingCount',
  //                 'descending': true,
  //               },
  //             )
  //             as List<Map<String, dynamic>>;

  //     List<ProductEntity> products =
  //         data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
  //     return right(products);
  //   } catch (e) {
  //     return left(ServerFailure('Failed to get products'));
  //   }
  // }

  @override
  Stream<Either<Failure, List<ProductEntity>>> getProducts() async* {
    try {
      List<Map<String, dynamic>> data =
          await databaseService.getData(path: BackendEndpoint.getProducts)
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      //  List<ProductEntity> productsEntity = products.map((e) => e.toEntity()).toList();
      yield right(products);
    } catch (e, stackTrace) {
      log('❌ Error while fetching products: $e');
      log('🧱 StackTrace: $stackTrace');
      yield left(ServerFailure('Failed to get products: ${e.toString()}'));
    }
  }
}
