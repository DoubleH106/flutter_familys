import 'dart:convert';

import 'package:http/http.dart' as http;
class HomeController{
  static Future<dynamic> News(String code) async{
    final response = await http.post(
      Uri.parse('http://localhost:7239/api/Home/listposts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'accId': "1",
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data deleteItem');
    }
  }
}