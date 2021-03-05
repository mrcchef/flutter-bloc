import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_players/bloc/player_listing_bloc.dart';
import 'package:football_players/bloc/player_listing_state.dart';
import 'package:football_players/helping_widget/message.dart';
import 'package:football_players/modals/api_result.dart';

class PlayerList extends StatelessWidget {
  Widget buildTile(Players player) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image(
          image: NetworkImage(
            'https://english.cdn.zeenews.com/sites/default/files/2020/05/16/861245-807322-805435-football.jpg',
          ),
          fit: BoxFit.cover,
          // height: 100,
          // width: 100,
        ),
      ),
      title: Text('${player.name}'),
      subtitle: Text('${player.club.name}'),
    );
  }

  // Bloc Builder is actually used to render the output according to the state
  // BlocBuilder<BlocA,BlocAState> where BlocA is the type of Bloc and
  // BlocAState is the type of State class
  // It has one multiple parameter
  // 1st : builder -> It takes a function (context,state) and it renders the
  // widget according to the state
  // 2nd : cubit -> It takes a instance of Bloc to whom it will listen and
  // any changes occur on that instance, builder will rebuild
  // If we have ommitted the parameter cubit then BlocBuilder automatically
  // listen to the changes that are occuring in the in the same context tree
  // 3rd: buildWhen -> It provide more fexibility in rebuilding widget b/c
  // builder method runs according to the buildWhen funtion
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerListingBloc, PlayerListingState>(
      cubit: BlocProvider.of<PlayerListingBloc>(context),
      builder: (ctx, state) {
        if (state is PlayerListingUninitalisedState)
          return Message("Select a country to fetch players");
        else if (state is PlayerListingFetchingState)
          return Message("Players are fetching");
        else if (state is PlayerListingErrorState)
          return Message("Something went wrong!!");
        else if (state is PlayerListingZeroPlayerState)
          return Message("Country has zero players");
        else {
          final playerFetchedState = state as PlayerListingFetchedState;
          List<Players> player = playerFetchedState.player;
          return Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) => buildTile(player[index]),
              itemCount: player.length,
            ),
          );
        }
      },
    );
  }
}
