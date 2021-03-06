import 'package:flutter/material.dart';
import 'package:football_players/modals/search_configuration.dart';
import 'package:football_players/modals/search_configuration.dart';
import 'package:football_players/modals/search_configuration.dart';
import 'package:football_players/theme/themes.dart';

class AdvanceSearch extends StatefulWidget {
  static const routeName = "/Advance-Search";

  @override
  _AdvanceSearchState createState() => _AdvanceSearchState();
}

class _AdvanceSearchState extends State<AdvanceSearch> {
  @override
  Widget build(BuildContext context) {
    final Map<String, SearchConfiguration> searchConfigurationMap =
        ModalRoute.of(context).settings.arguments;
    // print(searchConfigurationMap.runtimeType);
    final searchConfiguration = searchConfigurationMap['searchConfiguration'];
    // print(searchConfiguration.runtimeType);
    // final SearchConfiguration searchConfiguration =
    //     searchConfigurationMap['searchConfiguration'];

    void onSelectedPosition(bool check, String labelName) {
      setState(
        () {
          if (check)
            searchConfiguration.selectedPositions.add(labelName);
          else
            searchConfiguration.selectedPositions.remove(labelName);
          print(searchConfiguration.selectedPositions);
        },
      );
    }

    void onSelectedLeagues(bool check, String labelName) {
      setState(
        () {
          if (check)
            searchConfiguration.selectedLeagues.putIfAbsent(
                labelName, () => searchConfiguration.leagues[labelName]);
          else
            searchConfiguration.selectedLeagues.remove(labelName);
          print(searchConfiguration.selectedLeagues);
        },
      );
    }

    void onSelectedNations(bool check, String labelName) {
      setState(
        () {
          if (check)
            searchConfiguration.selectedNations.putIfAbsent(
                labelName, () => searchConfiguration.nations[labelName]);
          else
            searchConfiguration.selectedNations.remove(labelName);
          print(searchConfiguration.selectedNations);
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Advance Search"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                child: Text(
                  "POSITIONS",
                  style: searchFilterTextStyle,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                child: Wrap(
                  spacing: 5.0,
                  children: [
                    for (var positionName in searchConfiguration.positions)
                      ChoiceChip(
                        elevation: 2.0,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        label: Text(
                          '$positionName',
                          style: searchLabelTextStyle,
                        ),
                        selected: searchConfiguration.selectedPositions
                            .contains(positionName),
                        selectedColor: Colors.lightBlue[300],
                        labelStyle: searchLabelTextStyle.copyWith(
                            color: searchConfiguration.selectedPositions
                                    .contains(positionName)
                                ? Colors.white
                                : Colors.black),
                        onSelected: (check) {
                          onSelectedPosition(check, positionName);
                        },
                      )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                child: Text(
                  "LEAGUES",
                  style: searchFilterTextStyle,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                child: Wrap(
                  spacing: 5.0,
                  alignment: WrapAlignment.start,
                  children: [
                    for (var leaguesKey in searchConfiguration.leagues.keys)
                      ChoiceChip(
                        elevation: 2.0,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        label: Text(
                          '$leaguesKey',
                          style: searchLabelTextStyle,
                        ),
                        selected: searchConfiguration.selectedLeagues.keys
                            .contains(leaguesKey),
                        selectedColor: Colors.lightBlue[300],
                        labelStyle: searchLabelTextStyle.copyWith(
                            color: searchConfiguration.selectedLeagues.keys
                                    .contains(leaguesKey)
                                ? Colors.white
                                : Colors.black),
                        onSelected: (check) {
                          onSelectedLeagues(check, leaguesKey);
                        },
                      )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                child: Text(
                  "NATIONS",
                  style: searchFilterTextStyle,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
                child: Wrap(
                  spacing: 5.0,
                  alignment: WrapAlignment.start,
                  children: [
                    for (var nationsKey in searchConfiguration.nations.keys)
                      ChoiceChip(
                        elevation: 2.0,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        label: Text(
                          '$nationsKey',
                          style: searchLabelTextStyle,
                        ),
                        selected: searchConfiguration.selectedNations.keys
                            .contains(nationsKey),
                        selectedColor: Colors.lightBlue[300],
                        labelStyle: searchLabelTextStyle.copyWith(
                            color: searchConfiguration.selectedNations.keys
                                    .contains(nationsKey)
                                ? Colors.white
                                : Colors.black),
                        onSelected: (check) {
                          onSelectedNations(check, nationsKey);
                        },
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).pop<SearchConfiguration>(searchConfiguration);
          },
          label: Text(
            'Done',
            style: floatingButtonTextStyle,
          ),
          icon: Icon(Icons.done),
        ));
  }
}
