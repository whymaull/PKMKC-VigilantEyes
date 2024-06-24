import 'dart:convert';

import 'package:vigilanteyes/app/core/utils/constants.dart';
import 'package:vigilanteyes/app/data/entities/incident_entity.dart';
import 'package:vigilanteyes/app/data/entities/school_entity.dart';
import 'package:http/http.dart' as http;

class IncidentRepository {
  final tableName = "incidents";
  Future<List<IncidentEntity>> listAll(String id) async {
    var url = Uri.parse('$baseUrl/$tableName?select=*');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};
    final response = await http.get(url, headers: headers);

    return (jsonDecode(response.body) as List)
        .map((e) => IncidentEntity?.fromJson(e))
        .toList();
  }

  Future<List<IncidentEntity>> listAllByIdUser(String id) async {
    var url = Uri.parse('$baseUrl/$tableName?select=*&id_school=eq.$id');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};
    final response = await http.get(url, headers: headers);

    return (jsonDecode(response.body) as List)
        .map((e) => IncidentEntity?.fromJson(e))
        .toList();
  }

  Future<List<IncidentEntity>> listAllTypeBullnById(
      {required String idSchool, required String idBullying}) async {
    var url = Uri.parse(
        '$baseUrl/$tableName?select=*&id_school=eq.$idSchool&type_bullying=eq.$idBullying');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};
    final response = await http.get(url, headers: headers);

    return (jsonDecode(response.body) as List)
        .map((e) => IncidentEntity?.fromJson(e))
        .toList();
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
