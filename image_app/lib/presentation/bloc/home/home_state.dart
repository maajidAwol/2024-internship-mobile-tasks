part of 'home_bloc.dart';

//add sealed maybe

abstract class  HomeState  {
  

  
}

class HomeImageLoading extends HomeState {

  HomeImageLoading();
}

class HomeSuccessLoading extends HomeState {
  final List<ImageEntity> images;
  HomeSuccessLoading({required this.images});
}

class HomeFailureLoading extends HomeState {
 HomeFailureLoading();
}
