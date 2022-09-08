part of 'players_cubit.dart';

abstract class PlayersState {}

class PlayersInitial extends PlayersState {}

class PlayersError extends PlayersState {
  final String error;
  PlayersError(this.error);
}

class PlayersLoaded extends PlayersState {
  final PlayerResponse playerResponse;
  PlayersLoaded(this.playerResponse);
}
