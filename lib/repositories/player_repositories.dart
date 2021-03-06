import 'package:football_players/core/api_result_data_source.dart';
import 'package:football_players/modals/api_result.dart';
import 'package:football_players/modals/search_configuration.dart';

abstract class PlayerRepositories {
  Future<List<Players>> fetchPlayersByCountry(String countryId);
  Future<List<Players>> fetchPlayersByName(String playerName);
  Future<List<Players>> fetchPlayerByAdvanceSearch(
      SearchConfiguration searchConfiguration);
}

class PlayerRepositoriesImpl extends PlayerRepositories {
  final ApiResultDataSource _apiResultDataSource = ApiResultDataSource();

  @override
  Future<List<Players>> fetchPlayersByCountry(String countryId) =>
      // final List<Players> players =
      _apiResultDataSource.fetchPlayersByCountry(countryId);
  // print(players.length);
  // return players;
  // }
  @override
  Future<List<Players>> fetchPlayersByName(String playerName) =>
      // final List<Players> players =
      _apiResultDataSource.fetchPlayersByName(playerName);

  Future<List<Players>> fetchPlayerByAdvanceSearch(
          SearchConfiguration searchConfiguration) =>
      _apiResultDataSource.fetchPlayerByAdvanceSearch(searchConfiguration);
}
