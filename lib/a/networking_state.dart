part of 'networking_bloc.dart';

@immutable
abstract class NetworkingState {}

class NetworkingInitial extends NetworkingState {}

class NetworkingLoading extends NetworkingState {}

class NetworkingError extends NetworkingState {
  final String message;

  NetworkingError(this.message);
}

class NetworkingSuccess extends NetworkingState {
  final List<Postlar> posts;

  NetworkingSuccess(this.posts);
}
