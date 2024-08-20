import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/image_entity.dart';
import '../../../domain/usecases/get_image_usecase.dart';
import '../../../domain/usecases/get_searched_usecase.dart';
part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetAllImages getAllImages;
  GetSearchedImages getSearch;
  HomeBloc({required this.getAllImages,required this.getSearch}) : super(HomeImageLoading()) {
    on<HomeLoaded>(_onLoaded);
    on<HomeInitial>(_onInitial);
    on<ImageSearched>(_onSearched);
  }

  FutureOr<void> _onLoaded(HomeLoaded event, Emitter<HomeState> emit) async {
    // emit(HomeImageLoading());

    final result = await getAllImages.execute();

    emit(HomeSuccessLoading(images: result));
  }

  FutureOr<void> _onInitial(HomeInitial event, Emitter<HomeState> emit) {
    emit(HomeImageLoading());
  }

  FutureOr<void> _onSearched(ImageSearched event, Emitter<HomeState> emit) async{
    emit(HomeImageLoading());
    final result = await getSearch.execute(event.term);

    emit(HomeSuccessLoading(images: result));

  }
}
