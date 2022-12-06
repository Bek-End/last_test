import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(ShowSplashState()) {
    on<ShowProductEvent>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(ShowProductState());
    });
  }
}

abstract class SplashEvent {}

class ShowProductEvent extends SplashEvent {}

abstract class SplashState {}

class ShowSplashState extends SplashState {}

class ShowProductState extends SplashState {}
