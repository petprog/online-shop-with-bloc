part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  final List<Map<String, dynamic>> favorites;
  final List<Map<String, dynamic>> fav;
  const FavoritesState(this.favorites, this.fav);
}

class FavoritesInitial extends FavoritesState {
  FavoritesInitial() : super([], []);

  @override
  List<Object?> get props => [];
}

class FavoritesSuccess extends FavoritesState {
  const FavoritesSuccess(
    List<Map<String, dynamic>> favorites,
    List<Map<String, dynamic>> fav,
  ) : super(favorites, fav);

  @override
  List<Object?> get props => [favorites, fav];
}
