import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_players/bloc/player_listing_bloc.dart';
import 'package:football_players/repositories/player_repositories.dart';
import 'package:football_players/theme/themes.dart';
import 'package:football_players/widget/horizontal_bar.dart';
import 'package:football_players/widget/player_list.dart';
import 'package:football_players/widget/search_bar.dart';

class HomePage extends StatefulWidget {
  final PlayerRepositories playerRepositories;
  HomePage({this.playerRepositories});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // BlocProvider<T> is responsible for creating the instance of Bloc such that
  // the instance is accessible to inherited widgets
  // T is the Type of the Bloc
  // It has two parameter create and child
  // create take the method that returns the instance of Bloc of type T
  // child id the subtree
  // Now we can access the instance of the bloc using BlocProvider.of(context)
  // down the subtree i.e child widget
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlayerListingBloc>(
      create: (context) =>
          PlayerListingBloc(playerRepositories: widget.playerRepositories),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            alignment: Alignment.topCenter,
            child: Text(
              'FootBall Players',
              // style: appBarTextStyle,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Column(
          children: [
            HorizontalBar(),
            SearchBar(),
            SizedBox(
              height: 10,
            ),
            PlayerList(),
          ],
        ),
      ),
    );
  }
}
