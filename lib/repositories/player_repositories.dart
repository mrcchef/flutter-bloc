import 'package:football_players/core/api_result_data_source.dart';
import 'package:football_players/modals/api_result.dart';

abstract class PlayerRepositories {
  Future<List<Players>> fetchPlayersByCountry(String countryId);
  Future<List<Players>> fetchPlayersByName(String playerName);
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
}
