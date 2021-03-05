import 'package:flutter/cupertino.dart';
import 'package:football_players/modals/api_result.dart';

abstract class PlayerListingState {}

class PlayerListingUninitalisedState extends PlayerListingState {}

class PlayerListingFetchingState extends PlayerListingState {}

class PlayerListingFetchedState extends PlayerListingState {
  final List<Players> player;
  PlayerListingFetchedState({@required this.player})
      : assert(player != null, "player can not be null");
}

class PlayerListingZeroPlayerState extends PlayerListingState {}

class PlayerListingErrorState extends PlayerListingState {}
