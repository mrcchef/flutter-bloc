import 'dart:convert';

import 'package:football_players/core/api_constants.dart';
import 'package:football_players/modals/api_result.dart';
import 'package:http/http.dart' as http;

class ApiResultDataSource {
  Future<List<Players>> fetchPlayersByCountry(String countryId) async {
    final url = "${ApiConstants.BASE_URL}?country=$countryId";
    print(url);
    final response = await http.get(url);
    return parseResponse(response);
  }

  Future<List<Players>> fetchPlayersByName(String playerName) async {
    final url = "${ApiConstants.BASE_URL}?name=$playerName";
    print(url);
    final response = await http.get(url);
    return parseResponse(response);
  }

  List<Players> parseResponse(http.Response response) {
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return ApiResult.fromJson(responseBody).items;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
