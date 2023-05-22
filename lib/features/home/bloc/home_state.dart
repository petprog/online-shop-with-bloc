// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final List<Sneakers>? menSneakersList;
  final List<Sneakers>? womenSneakersList;
  final List<Sneakers>? kidsSneakersList;
  const HomeState(
    this.menSneakersList,
    this.womenSneakersList,
    this.kidsSneakersList,
  );
}

class HomeInitialState extends HomeState {
  const HomeInitialState() : super(null, null, null);
  @override
  List<Object?> get props =>
      [menSneakersList, womenSneakersList, kidsSneakersList];
}

class HomeSuccessState extends HomeState {
  const HomeSuccessState(List<Sneakers> menSneakersList,
      List<Sneakers> womenSneakersList, List<Sneakers> kidsSneakersList)
      : super(menSneakersList, womenSneakersList, kidsSneakersList);
  @override
  List<Object?> get props =>
      [menSneakersList, womenSneakersList, kidsSneakersList];
}
