import 'package:dartz/dartz.dart';

// import '../../../Features/edit/domain/entities/product_entity.dart';
import '../../entites/product_entity.dart';
import '../../errors/failures.dart';

abstract class ProductsRepo {
  Stream<Either<Failure, List<ProductEntity>>> getProducts();
  // Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
