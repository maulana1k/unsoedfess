import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _releaseUrl = 'https://unsoedfess-server.vercel.app/api/v1';
  static const String _debugUrl = 'http://10.0.2.2:8000/api/v1';
  static const String _baseUrl = kReleaseMode ? _releaseUrl : _debugUrl;

  static Future<http.Response> post(String path, Object body) {
    String jsonBody = jsonEncode(body);
    return http.post(Uri.parse('$_baseUrl/$path'),
        headers: {'Content-Type': 'application/json'}, body: jsonBody);
  }

  static Future<http.Response> get(String path) {
    return http.get(Uri.parse('$_baseUrl/$path'), headers: {'Content-Type': 'application/json'});
  }
}
