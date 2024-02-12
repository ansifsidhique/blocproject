
import '../../model/home_product_data_model.dart';

abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class SuccessState extends CartState{
  final List<ProductDataModel> cartItem;

  SuccessState({required this.cartItem});
}