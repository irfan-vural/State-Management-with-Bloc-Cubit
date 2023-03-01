import 'dart:convert';
import 'dart:io';

import '../model/cat_model.dart';
import 'package:http/http.dart' as http;

abstract class CatRepository {
  Future<List<Cat>> fetchCats();
}

String url = 'https://api.thecatapi.com/v1/images/search?limit=10';

class SampleCatsRepository extends CatRepository {
  @override
  Future<List<Cat>> fetchCats() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body) as List;
      return jsonBody.map<Cat>((json) => Cat.fromJson(json)).toList();
    } else {
      throw const HttpException('Error');
    }
  }
}
