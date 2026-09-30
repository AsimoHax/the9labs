import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<Map<String, dynamic>?> getData() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        debugPrint('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error occurred: $e');
      return null;
    }
  }
}
