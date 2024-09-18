import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class InitialHomeState extends HomeState {
  @override
  List<Object> get props => <Object>[];
}

class SuccessNowPlayingHomeState extends HomeState {
  const SuccessNowPlayingHomeState();

  @override
  List<Object> get props => <Object>[];
}

class SuccessUpComingHomeState extends HomeState {
  const SuccessUpComingHomeState();

  @override
  List<Object> get props => <Object>[];
}

class SuccessTopRatedHomeState extends HomeState {
  const SuccessTopRatedHomeState();

  @override
  List<Object> get props => <Object>[];
}

class LoadingHomeState extends HomeState {
  const LoadingHomeState();

  @override
  List<Object> get props => <Object>[];
}

class ErrorHomeState extends HomeState {
  const ErrorHomeState({required this.error});

  final Object error;

  @override
  List<Object> get props => <Object>[error];
}
