part of 'home_bloc.dart';


abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {

  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<HomeStoreEntity> loadedHomestore;
  final List<HomeStoreEntity> loadedBestseller;

  const HomeLoadedState({
    required this.loadedHomestore,
    required this.loadedBestseller,
  });

  @override
  List<Object> get props => [loadedHomestore,loadedBestseller];
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState({required this.message});

  @override
  List<Object> get props => [message];
}