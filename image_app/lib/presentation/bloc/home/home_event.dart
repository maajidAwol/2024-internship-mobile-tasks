part of 'home_bloc.dart';
class HomeEvent {
  HomeEvent();
}
class HomeInitial extends HomeEvent{
  HomeInitial();
}

class HomeLoaded extends HomeEvent {
  HomeLoaded();
}
class ImageSearched extends HomeEvent {
  String term;
  ImageSearched({required this.term});
}
