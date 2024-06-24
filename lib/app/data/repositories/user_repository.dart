import 'dart:convert';

import 'package:vigilanteyes/app/core/utils/constants.dart';
import 'package:vigilanteyes/app/data/entities/school_entity.dart';
import 'package:http/http.dart' as http;
import 'package:vigilanteyes/app/data/entities/user_entity.dart';

class UserRepository {
  final tableName = "user";
  Future<List<UserEntity>> listAll() async {
    var url = Uri.parse('$baseUrl/$tableName?select=*');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};
    final response = await http.get(url, headers: headers);

    return (jsonDecode(response.body) as List)
        .map((e) => UserEntity.fromJson(e))
        .toList();
  }

  Future<UserEntity?> findByUUID(String id) async {
    var url = Uri.parse('$baseUrl/$tableName?uuid=eq.$id&select=*');
    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Range': '0-9'
    };
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      // Handle successful response
      return (jsonDecode(response.body) as List)
          .map((e) => UserEntity.fromJson(e))
          .toList()
          .first;
    } else {
      // Handle error response
      return null;
    }
  }
}
