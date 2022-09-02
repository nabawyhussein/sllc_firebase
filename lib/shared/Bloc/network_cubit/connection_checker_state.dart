part of 'connection_checker_cubit.dart';

@immutable
abstract class ConnectionCheckerState {}

class InternetConnectionLoading extends ConnectionCheckerState {}

class InternetConnectionConnected extends ConnectionCheckerState {
  final InternetConnectionStatus? internetConnectionStatus;

  InternetConnectionConnected({required this.internetConnectionStatus});
}

class InternetConnectionDisconnected extends ConnectionCheckerState {}
