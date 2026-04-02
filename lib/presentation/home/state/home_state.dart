import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({this.isLoading = false});

  final bool isLoading;

  @override
  List<Object> get props => [isLoading];

  HomeState copyWith({bool? isLoading}) {
    return HomeState(isLoading: isLoading ?? this.isLoading);
  }

  factory HomeState.initial() => const HomeState();
}
