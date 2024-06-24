import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vigilanteyes/app/core/utils/constants.dart';
import 'package:vigilanteyes/app/data/entities/client_entity.dart';

class ClientRepository {
  Future<List<ClientEntity>> listAll() async {
    var url = Uri.parse('$baseUrl/client?select=*');
    var headers = {'apikey': apiKey, 'Authorization': 'Bearer $apiKey'};
    final response = await http.get(url, headers: headers);
    return (jsonDecode(response.body) as List)
        .map((e) => ClientEntity.fromJson(e))
        .toList();
  }

  Future<ClientEntity?> findByUuid(String uuid) async {
    var url = Uri.parse('$baseUrl/client?uuid=eq.$uuid&select=*');
    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Range': '0-9'
    };
    var response = await http.get(url, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // Handle successful response
      var clientList = (jsonDecode(response.body) as List)
          .map((e) => ClientEntity.fromJson(e))
          .toList();
      if (clientList.isNotEmpty) {
        return clientList.first;
      } else {
        // If no client with the given uuid is found, return null
        return null;
      }
    } else {
      // Handle error response
      return null;
    }
  }

  Future<ClientEntity?> findById(int id) async {
    var url = Uri.parse('$baseUrl/client?id=eq.$id&select=*');
    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Range': '0-9'
    };
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      // Handle successful response
      return (jsonDecode(response.body) as List)
          .map((e) => ClientEntity.fromJson(e))
          .toList()
          .first;
    } else {
      // Handle error response
      return null;
    }
  }

  Future<bool> postData({
    // required String tokenClient,
    required String name,
    required String address,
    required String phone,
    required String email,
    required String password,
    required String uuid,
    required String userName,
    required String image,
    required String gender,
    required DateTime dateOFBirth,
  }) async {
    var url = Uri.parse('$baseUrl/client');
    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal',
    };
    var body = {
      "name": name,
      "address": address,
      "phone": phone,
      "email": email,
      "password": password,
      "uuid": uuid,
      "user_name": userName,
      "image": image,
      "gender": gender,
      // "token_client": tokenClient,
      // "date_of_birth": DateFormat('yyyy-MM-dd HH:mm:ss').format(dateOFBirth),
    };

    var response =
        await http.post(url, headers: headers, body: jsonEncode(body));
    return response.statusCode == 201;
  }

  Future<bool> updateByUuid({
    required String uuid,
    required String name,
    String? img,
    // required String address,
    // required String phone,
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/client?uuid=eq.$uuid');
    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal',
    };
    var body = {
      "name": name,
      // "address": address,
      // "phone": phone,
      "image": img,
      "email": email,
      "password": password,
      "uuid": uuid,
    };
    var response =
        await http.patch(url, headers: headers, body: jsonEncode(body));
    print(response.statusCode);
    return response.statusCode == 204;
  }

  Future<bool> updateClient({
    required int id,
    String? name,
    String? address,
    int? phone,
    String? email,
    String? password,
    String? uuid,
    String? userName,
    String? img,
    String? gender,
    String? tokenClient,
    DateTime? dateOFBirth,
  }) async {
    var url = Uri.parse('$baseUrl/client?id=eq.$id');
    var headers = {
      'apikey': apiKey,
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
      'Prefer': 'return=minimal',
    };

    // Create a new Map to hold only the fields that need to be updated
    var updateFields = <String, dynamic>{};

    if (name != null) updateFields["name"] = name;
    if (address != null) updateFields["address"] = address;
    if (phone != null) updateFields["phone"] = phone;
    if (email != null) updateFields["email"] = email;
    if (password != null) updateFields["password"] = password;
    if (uuid != null) updateFields["uuid"] = uuid;
    if (userName != null) updateFields["user_name"] = userName;
    if (img != null) updateFields["image"] = img;
    if (tokenClient != null) updateFields["token_client"] = tokenClient;
    if (gender != null) updateFields["gender"] = gender;

    // Ubah objek DateTime menjadi string format tertentu (misal: 'yyyy-MM-dd HH:mm:ss')
    // if (dateOFBirth != null) {
    //   String formattedDate =
    //       DateFormat('yyyy-MM-dd HH:mm:ss').format(dateOFBirth);
    //   updateFields["date_of_birth"] = formattedDate;
    // }

    var response =
        await http.patch(url, headers: headers, body: jsonEncode(updateFields));
    print(response.statusCode);
    return response.statusCode == 204;
  }
}
