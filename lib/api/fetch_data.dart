import 'dart:convert';

import 'package:congresos/models/events.dart';
import 'package:congresos/models/homescreen.dart';
import 'package:congresos/models/links.dart';
import 'package:congresos/models/photos.dart';
import 'package:congresos/models/presentation.dart';
import 'package:http/http.dart' as http;

final String url = 'http://eventos.solutions.com.do';


Future<List<DataModel>> fetchData(http.Client client) async {
  final response = await client.get('$url/all');
  final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  return parsed
      .map<DataModel>((json) => DataModel.fromJson(json))
      .toList();
}
