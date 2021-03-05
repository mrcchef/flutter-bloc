import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_players/bloc/player_listing_bloc.dart';
import 'package:football_players/bloc/player_listing_event.dart';

class SearchBar extends StatelessWidget {
  // String playerName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintText: "Search player by Name",
        ),
        onChanged: (newMess) {
          BlocProvider.of<PlayerListingBloc>(context)
              .add(PlayerSearchByNameEvent(playerName: newMess));
        },
      ),
    );
  }
}
