import 'package:equatable/equatable.dart';
import '../../../core/models/viewed_prod_model.dart';

abstract class ViewedProdState extends Equatable {
  const ViewedProdState();

  @override
  List<Object> get props => [];
}

class ViewedProdInitial extends ViewedProdState {}

class ViewedProdUpdated extends ViewedProdState {
  final Map<String, ViewedProdModel> viewedProdItems;

  const ViewedProdUpdated(this.viewedProdItems);

  @override
  List<Object> get props => [viewedProdItems];
}
