import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class InitialSearchState extends SearchState {
  @override
  List<Object> get props => <Object>[];
}

class SuccessSearchState extends SearchState {
  const SuccessSearchState();

  @override
  List<Object> get props => <Object>[];
}

class LoadingSearchState extends SearchState {
  const LoadingSearchState();

  @override
  List<Object> get props => <Object>[];
}

class ErrorSearchState extends SearchState {
  const ErrorSearchState({required this.error});

  final Object error;

  @override
  List<Object> get props => <Object>[error];
}

class RefreshLoadingState extends SearchState {
  @override
  List<Object> get props => <Object>[];
}

class RefreshSuccessState extends SearchState {
  @override
  List<Object> get props => <Object>[];
}
