import 'dart:convert';

import 'package:vigilanteyes/app/core/utils/constants.dart';
import 'package:vigilanteyes/app/data/entities/kelas_entity.dart';
import 'package:vigilanteyes/app/data/entities/school_entity.dart';
import 'package:http/http.dart' as http;

class KelasRepository {
  final tableName = "school_cctv";
  Future<List<KelasEntity>> listAll(
      {required String id, String? keyword}) async {
    String keywordFilter =
        keyword != null ? '&lokasi_cctv=like.%25$keyword%25' : '';
    var url = Uri.parse(
        '$baseUrl/$tableName?select=*&school_id=eq.$id$keywordFilter');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      if (responseBody is List && responseBody.isNotEmpty) {
        return responseBody.map((e) => KelasEntity.fromJson(e)).toList();
      } else {
        // Handle empty list case
        return [];
      }
    } else {
      // Handle error response
      throw Exception('Failed to load data');
    }
  }

  Future<SchoolEntity?> findById(int id) async {
    var url = Uri.parse('$baseUrl/$tableName?school_id=eq.$id&select=*');
    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Range': '0-9'
    };
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      // Handle successful response
      return (jsonDecode(response.body) as List)
          .map((e) => SchoolEntity.fromJson(e))
          .toList()
          .first;
    } else {
      // Handle error response
      return null;
    }
  }
}
