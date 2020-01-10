import 'dart:convert';

import 'package:congresos/models/events.dart';
import 'package:congresos/models/homescreen.dart';
import 'package:congresos/models/links.dart';
import 'package:congresos/models/photos.dart';
import 'package:congresos/models/presentation.dart';
import 'package:http/http.dart' as http;

final String url = 'https://dummy-data-api.herokuapp.com';
// final String url = 'http://192.168.1.108:8080';

///home_screen_icons endpoint
Future<List<HomeScreenModel>> fetchHomeScreen(http.Client client) async {
  final response = await client.get('$url/home_screen_icons');
  final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  return parsed
      .map<HomeScreenModel>((json) => HomeScreenModel.fromJson(json))
      .toList();
}

///events endpoint
Future<List<EventsModel>> fetchEvents(http.Client client) async {
  http.Response response = await client.get('$url/events');
  final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  return parsed.map<EventsModel>((json) => EventsModel.fromJson(json)).toList();
}

///links endpoint
Future<List<LinksModel>> fetchLinks(http.Client client) async {
  final response = await client.get('$url/links');
  final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  return parsed.map<LinksModel>((json) => LinksModel.fromJson(json)).toList();
}

///photos endpoint
Future<List<PhotosModel>> fetchPhotos(http.Client client) async {
  final response = await client.get('$url/photos');
  final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  return parsed.map<PhotosModel>((json) => PhotosModel.fromJson(json)).toList();
}

///presentation endpoint
Future<List<PresentationModel>> fetchPresentations(http.Client client) async {
  final response = await client.get('$url/presentations');
  final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  return parsed
      .map<PresentationModel>((json) => PresentationModel.fromJson(json))
      .toList();
}
