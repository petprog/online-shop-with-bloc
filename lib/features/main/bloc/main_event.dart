part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {}

class MainInitailEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}

class MainChangePageEvent extends MainEvent {
  final int pageIndex;
  MainChangePageEvent({required this.pageIndex});
  @override
  List<Object?> get props => [pageIndex];
}
