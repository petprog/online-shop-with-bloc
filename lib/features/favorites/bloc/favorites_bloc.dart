import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final Box<dynamic> _favBox = Hive.box('fav_box');

  FavoritesBloc() : super(FavoritesInitial()) {
    on<FavoritesGetFavoritesEvent>(getFavoritesEvent);
    on<FavoritesGetFavEvent>(getFavEvent);
    on<FavoritesAddFavoritesEvent>(addFavoritesEvent);
    on<FavoritesRemoveFavoriteEvent>(favoritesRemoveFavoriteEvent);
    on<FavoritesDeleteFavEvent>(deleteFavEvent);
  }

  bool isFavorite(String id) {
    return state.favorites.any((element) => element['id'] == id);
  }

  FutureOr<void> favoritesRemoveFavoriteEvent(
      FavoritesRemoveFavoriteEvent event, Emitter<FavoritesState> emit) {
    final fav = state.favorites..remove((element) => element['id'] == event.id);
    emit(FavoritesSuccess(fav, state.fav));
    add(FavoritesGetFavoritesEvent());
  }

  FutureOr<void> getFavoritesEvent(
      FavoritesGetFavoritesEvent event, Emitter<FavoritesState> emit) {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        'key': key,
        'id': item["id"],
      };
    }).toList();
    emit(FavoritesSuccess(favData, state.fav));
  }

  FutureOr<void> getFavEvent(
      FavoritesGetFavEvent event, Emitter<FavoritesState> emit) {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        'key': key,
        'id': item["id"],
        'name': item["name"],
        'category': item["category"],
        'price': item["price"],
        'imageUrl': item["imageUrl"],
      };
    }).toList();
    final reversedfavData = favData.reversed.toList();
    emit(FavoritesSuccess(state.favorites, reversedfavData));
  }

  FutureOr<void> addFavoritesEvent(
      FavoritesAddFavoritesEvent event, Emitter<FavoritesState> emit) async {
    await _favBox.add(event.newFavorites);
    add(FavoritesGetFavoritesEvent());
  }

  FutureOr<void> deleteFavEvent(
      FavoritesDeleteFavEvent event, Emitter<FavoritesState> emit) {
    _favBox.delete(event.key);
  }
}
