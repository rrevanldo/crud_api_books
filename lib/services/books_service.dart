import 'dart:convert';
import 'dart:js';
import 'dart:math';

import 'package:books_api/pages/books/list_books.dart';
import 'package:books_api/global.dart';
import 'package:books_api/models/buku_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BookService {
  Future getListBook() async {
    try {
      var response = await http.get(Uri.parse("${Global.BASE_API_URL}/books"));
      print("Response ${response.statusCode}");
      print("response ${response.body}");
      var data = jsonDecode(response.body);
      print("response ${data}");
      return BukuModel.fromJson(data);
    } catch (e) {
      print("error get list $e");
      return null;
    }
  }

  Future<Data> createBook(Data cases) async {
    Map data = {
      'id': cases.id,
      'title': cases.title,
      'description': cases.description,
      'created_at': cases.createdAt,
      'updated_at': cases.updatedAt,
    };

    final response = await http.post(
      Uri.parse("${Global.BASE_API_URL}/create"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      print("response${response.statusCode}");
      print("response ${response.body}");
      var data = jsonDecode(response.body);
      print("response ${data}");
      return Data.fromJson(json.decode(response.body));
    } else {
      print("error create $e");
      throw Exception('Failed to post books');
    }
  }

  deleteBook(int id) async {
    try {
      var response =
          await http.delete(Uri.parse("${Global.BASE_API_URL}/delete/$id"));
      print("response${response.statusCode}");
      print("response ${response.body}");
      var data = jsonDecode(response.body);
      print("response ${data}");
      return data;
    } catch (e) {
      print("error delete $e");
      return null;
    }
  }

  Future<Data> updateBook(int id, Data cases) async {
    Map data = {
      'id': cases.id,
      'title': cases.title,
      'description': cases.description,
      'created_at': cases.createdAt,
      'updated_at': cases.updatedAt,
    };

    final response = await http.put(
      Uri.parse("${Global.BASE_API_URL}/update/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      print("response${response.statusCode}");
      print("response ${response.body}");
      var data = jsonDecode(response.body);
      print("response ${data}");
      return Data.fromJson(json.decode(response.body));
    } else {
      print("error update $e");
      throw Exception('Failed to update books');
    }
  }
  
}
