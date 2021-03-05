import 'package:flutter/cupertino.dart';
import 'package:football_players/modals/nation_model.dart';

class PlayerListingEvent {}

class CountrySelectEvent extends PlayerListingEvent {
  final NationModel nationModel;

  CountrySelectEvent({@required this.nationModel})
      : assert(nationModel != null, 'Nation Model can not be null');
}

class PlayerSearchByNameEvent extends PlayerListingEvent {
  final String playerName;
  PlayerSearchByNameEvent({@required this.playerName})
      : assert(playerName != null, "PlayerName cannot be null");
}
