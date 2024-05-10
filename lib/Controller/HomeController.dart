import 'dart:convert';

import 'package:http/http.dart' as http;
class HomeController{
  static Future<dynamic> News(int id) async{
    final response = await http.post(
      Uri.parse('http://localhost:7239/api/Home/listposts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'accId': 1,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data deleteItem');
    }
  }
  static Future<dynamic> likepost(int Accid,int HomeId) async{
    final response = await http.post(
      Uri.parse('http://localhost:7239/api/Home/likepost'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'accId': 1,
        'homeId':HomeId,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data deleteItem');
    }
  }
  static Future<dynamic> offlikepost(int Accid,int HomeId) async{
    final response = await http.post(
      Uri.parse('http://localhost:7239/api/Home/offlikepost'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'accId': 1,
        'homeId':HomeId,
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data deleteItem');
    }
  }
  static Future<dynamic> addcomment(int Accid,int HomeId,String comment) async{
    final response = await http.post(
      Uri.parse('http://localhost:7239/api/Home/Comments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'accId': 1,
        'homeId':HomeId,
        'comment':comment
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data deleteItem');
    }
  }
  static Future<dynamic> listComments(int Accid,int HomeId,String comment) async{
    final response = await http.post(
      Uri.parse('http://localhost:7239/api/Home/listComments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'accId': 0,
        'homeId':HomeId,
        'comment':""
      }),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data deleteItem');
    }
  }
}