import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_players/bloc/player_listing_bloc.dart';
import 'package:football_players/bloc/player_listing_event.dart';
import 'package:football_players/modals/nation_model.dart';

class HorizontalBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return InkWell(
            onTap: () {
              // Here we are accessing the instance of our bloc
              // add() method takes the event that is to be executing
              // like here we are selecting country
              BlocProvider.of<PlayerListingBloc>(context)
                  .add(CountrySelectEvent(nationModel: nations[index]));
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    nations[index].imagePath,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: nations.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
