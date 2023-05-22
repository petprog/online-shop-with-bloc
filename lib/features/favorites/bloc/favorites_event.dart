part of 'favorites_bloc.dart';

abstract class FavoritesEvent {}

class FavoritesInitialEvent extends FavoritesEvent {}

class FavoritesGetFavoritesEvent extends FavoritesEvent {}

class FavoritesGetFavEvent extends FavoritesEvent {}

class FavoritesAddFavoritesEvent extends FavoritesEvent {
  final Map<String, dynamic> newFavorites;
  FavoritesAddFavoritesEvent(this.newFavorites);
}

class FavoritesRemoveFavoriteEvent extends FavoritesEvent {
  final String id;
  FavoritesRemoveFavoriteEvent(this.id);
}

class FavoritesDeleteFavEvent extends FavoritesEvent {
  final int key;
  FavoritesDeleteFavEvent(this.key);
}
