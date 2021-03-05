import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:football_players/bloc/player_listing_event.dart';
import 'package:football_players/bloc/player_listing_state.dart';
import 'package:football_players/modals/api_result.dart';
import 'package:football_players/repositories/player_repositories.dart';
import 'package:rxdart/rxdart.dart';

// In the Bloc constructor we have to pass the initial state as we have done
// through super();
class PlayerListingBloc extends Bloc<PlayerListingEvent, PlayerListingState> {
  PlayerRepositories playerRepositories;
  PlayerListingBloc({@required this.playerRepositories})
      : assert(
            playerRepositories != null, "Player repositories can not be null"),
        super(PlayerListingUninitalisedState());

  //When ever an event is called a mapEventToState() method is executed
  //that maps events to different states but before calling mapEventToState()
  //transformEvents() is called which and we have used debounceTime() that
  //has Duration parameter
  //The way this method works it that as the event is called it will block
  //all the stream within this duration then it will pass the stream and it
  //will be continued this way i.e blocks the stream in the given duration and
  //allows the strams after that duration
  @override
  Stream<Transition<PlayerListingEvent, PlayerListingState>> transformEvents(
      Stream<PlayerListingEvent> events, transitionFn) {
    return super.transformEvents(
        (events as PublishSubject<PlayerListingEvent>)
            .debounceTime(Duration(milliseconds: 2000)),
        transitionFn);
  }

  // mapEventToState() method takes a event and returns multiple state on the
  // basics of current state of event
  @override
  Stream<PlayerListingState> mapEventToState(PlayerListingEvent event) async* {
    yield PlayerListingFetchingState();

    try {
      List<Players> player = [];
      if (event is CountrySelectEvent) {
        player = await playerRepositories
            .fetchPlayersByCountry(event.nationModel.countryId);
      } else if (event is PlayerSearchByNameEvent) {
        player = await playerRepositories.fetchPlayersByName(event.playerName);
      }
      print(player.length);
      if (player.length == 0)
        yield PlayerListingZeroPlayerState();
      else
        yield PlayerListingFetchedState(player: player);
    } catch (_) {
      print("hello");
      yield PlayerListingErrorState();
    }
  }
}
