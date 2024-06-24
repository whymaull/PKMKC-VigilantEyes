import 'dart:convert';

import 'package:vigilanteyes/app/core/utils/constants.dart';
import 'package:vigilanteyes/app/data/entities/school_entity.dart';
import 'package:http/http.dart' as http;

class SchoolRepository {
  final tableName = "school";
  Future<List<SchoolEntity>> listAll() async {
    var url = Uri.parse('$baseUrl/$tableName?select=*');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};
    final response = await http.get(url, headers: headers);

    return (jsonDecode(response.body) as List)
        .map((e) => SchoolEntity.fromJson(e))
        .toList();
  }
}
