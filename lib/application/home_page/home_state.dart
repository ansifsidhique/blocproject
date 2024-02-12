

import '../../model/home_product_data_model.dart';

abstract class HomeState {}



class HomeInitial extends HomeState {}
abstract class HomeActionState extends HomeState{}

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  final List<ProductDataModel> product;

  HomeLoadedSuccessState({required this.product});
}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishlistPageActionState extends HomeActionState{}

class HomeNavigateToCartPageActionState extends HomeActionState{}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}


