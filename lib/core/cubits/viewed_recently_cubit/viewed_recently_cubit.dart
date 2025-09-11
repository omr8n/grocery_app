// import 'package:e_commerce_shop_smart/Features/edit/domain/entities/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/entites/product_entity.dart';
import 'package:uuid/uuid.dart';
import '../../../core/models/viewed_prod_model.dart';
import 'viewed_recently_state.dart';

class ViewedProdCubit extends Cubit<ViewedProdState> {
  ViewedProdCubit() : super(ViewedProdInitial());

  // هنا لازم يكون المفتاح من نوع String (productId) مش ProductEntity
  final Map<String, ViewedProdModel> _viewedProdItems = {};
  final Uuid _uuid = const Uuid();

  Map<String, ViewedProdModel> get viewedProdItems =>
      Map.unmodifiable(_viewedProdItems);

  // صححت الشرط لأن المفتاح صار String
  bool isProductViewed(ProductEntity productEntity) =>
      _viewedProdItems.containsKey(productEntity.productId);

  // دالة إضافة المنتج للسجل
  void addProductToHistory(ProductEntity productEntity) {
    if (isProductViewed(productEntity)) {
      return; // المنتج موجود مسبقًا، نتجاهل
    }

    _viewedProdItems[productEntity.productId] = ViewedProdModel(
      id: _uuid.v4(),
      productId: productEntity.productId,
    );

    emit(ViewedProdUpdated(Map.from(_viewedProdItems)));
  }

  void clearHistory() {
    _viewedProdItems.clear();
    emit(ViewedProdUpdated(Map.from(_viewedProdItems)));
  }
}
