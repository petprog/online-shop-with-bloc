part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  final int? pageIndex;
  const MainState(
    this.pageIndex,
  );
}

class MainInitialState extends MainState {
  const MainInitialState() : super(0);
  @override
  List<Object?> get props => [pageIndex];
}

class MainPageIndexState extends MainState {
  const MainPageIndexState(int? pageIndex) : super(pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}
